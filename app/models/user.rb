class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  # 半角英数字のみバリデーション
  validates :last_name_kana, format: { with: /\A[a-z0-9]+\z/ }
  validates :first_name, presence: true
  # 半角英数字のみバリデーション
  validates :first_name_kana, format: { with: /\A[a-z0-9]+\z/ }
  validates :introduction, length: { maximum: 100 }
  validates :email,
            format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/ },
            presence: true
  validates :encrypted_password, presence: true

  attachment :image, destroy: false
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :posts, through: :favorites

  # foreign_key（FK）には、@user.xxxとした際に「@user.idがfollower_idなのかfollowed_idなのか」を指定
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # @user.yyyで、そのユーザがフォローしている人orフォローされている人の一覧を出します。
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def following?(follower)
    followings.include?(follower)
  end

  def follow(follower)
    unless self == follower
      relationships.find_or_create_by(followed_id: follower.id)
    end
  end

  def unfollow(follower)
    relationship = relationships.find_by(followed_id: follower.id)
    relationship.destroy if relationship
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("last_name_kana LIKE ?", "#{word}").or(User.where("first_name_kana LIKE ?", "#{word}"))
    elsif search == "forward_match"
      @user = User.where("last_name_kana LIKE ?", "#{word}").or(User.where("first_name_kana LIKE ?", "#{word}%"))
    elsif search == "backward_match"
      @user = User.where("last_name_kana LIKE ?", "#{word}").or(User.where("first_name_kana LIKE ?", "%#{word}"))
    elsif search == "partial_match"
      @user = User.where("last_name_kana LIKE ?", "#{word}").or(User.where("first_name_kana LIKE ?", "%#{word}%"))
    else
      @user = User.all
    end
  end

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visiter_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  # フォロー時の通知
  def create_notification_follow!(current_user)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ? ", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms
end
