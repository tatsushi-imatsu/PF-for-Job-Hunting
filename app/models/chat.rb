class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :sentence, presence: true, length: { maximum: 100 }
  
  has_many :notifications, dependent: :destroy
  
  # 以下チャット通知の定義
  def create_notification_chat!(current_user)
    notification = current_user.active_notifications.new(
      room_id: room.id,
      chat_id: self.id,
      # ログインユーザ
      visited_id: room.other_user(user.id),
      # ログインユーザのルーム内にいるもう一人のユーザ
      action: 'chat'
    )
    notification.save
  end
  
end
