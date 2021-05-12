class Post < ApplicationRecord

  belongs_to :user
  validates :name, presence: true
	validates :body, presence: true, length: {maximum: 200}
	has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

   # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("name LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

end
