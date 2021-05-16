class RenamePartnerIdColomnToChats < ActiveRecord::Migration[5.2]
  def change
    rename_column :chats, :partner_id, :room_id
  end
end
