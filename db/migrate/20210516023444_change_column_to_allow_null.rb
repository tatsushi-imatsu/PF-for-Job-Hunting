class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]

  def up
    change_column :chats, :user_id, :integer, null: true # null: trueを明示する必要がある
    change_column :chats, :room_id, :integer, null: true
    change_column :chats, :sentence, :string, null: true
  end

  def down
    change_column :chats, :user_id, :integer, null: false
    change_column :chats, :room_id, :integer, null: false
    change_column :chats, :sentence, :string, null: false
  end

end
