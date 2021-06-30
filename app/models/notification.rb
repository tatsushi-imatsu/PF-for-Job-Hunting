class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  # 常に新しい通知からデータを取得することができる
  belongs_to :post, optional: true
  belongs_to :post_comment, optional: true

  belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  
  belongs_to :room, optional: true
  belongs_to :message, optional: true
  
end
