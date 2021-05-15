class RemoveFavoriteFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :favorite_id, :integer
  end
end
