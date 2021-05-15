class RenamePostcommentIdColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :postcomment_id, :post_comment_id
  end
end
