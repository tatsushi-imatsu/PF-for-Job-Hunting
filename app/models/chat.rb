class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :sentence, presence: true
  
  has_many :notifications, dependent: :destroy
  
  def create_notification_chat!(current_user)
    notification = current_user.active_notifications.new(
      room_id: room.id,
      chat_id: self.id,
      visited_id: room.other_user(user.id),
      action: 'chat'
    )
    notification.save
  end
  
end
