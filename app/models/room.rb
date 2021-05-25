class Room < ApplicationRecord
  has_many :chats
  has_many :user_rooms
  
  has_many :notifications, dependent: :destroy
  
  def other_user(user_id)
    user_rooms.where.not(user_id: user_id).first.user_id
  end
  
end
