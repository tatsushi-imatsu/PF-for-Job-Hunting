class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :last_name_kana, format: { with:/\A[a-zA-Z]+\z/}
  validates :first_name, presence: true
  validates :first_name_kana, format: { with: /\A[a-zA-Z]+\z/}
  validates :introduction,length: { maximum: 100}

  has_many :posts
  attachment :image, destroy: false
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # foreign_key（FK）には、@user.xxxとした際に「@user.idがfollower_idなのかfollowed_idなのか」を指定します。
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # @user.yyyで、そのユーザがフォローしている人orフォローされている人の一覧を出します。
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def following?(follower)
    self.followings.include?(follower)
  end

  def follow(follower)
    unless self == follower
      self.relationships.find_or_create_by(followed_id: follower.id)
    end
  end

  def unfollow(follower)
    relationship = self.relationships.find_by(followed_id: follower.id)
    relationship.destroy if relationship
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("last_name_kana LIKE ?" , "#{word}").or(User.where("first_name_kana LIKE ?" , "#{word}"))
    elsif search == "forward_match"
      @user = User.where("last_name_kana LIKE ?" , "#{word}").or(User.where("first_name_kana LIKE ?" , "#{word}%"))
    elsif search == "backward_match"
      @user = User.where("last_name_kana LIKE ?" , "#{word}").or(User.where("first_name_kana LIKE ?" , "%#{word}"))
    elsif search == "partial_match"
      @user = User.where("last_name_kana LIKE ?" , "#{word}").or(User.where("first_name_kana LIKE ?" , "%#{word}%"))
    else
      @user = User.all
    end

  end

end



