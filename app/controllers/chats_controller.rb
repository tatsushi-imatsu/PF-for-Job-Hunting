class ChatsController < ApplicationController
  def show
    # どのユーザーとチャットするかを取得。
    @user = User.find(params[:id])
    # カレントユーザーのuser_roomにあるroom_idの値の配列をroomsに代入。
    rooms = current_user.user_rooms.pluck(:room_id)
    # user_roomモデルから
      # user_idがチャット相手のidが一致するものと、
      # room_idが上記roomsのどれかに一致するレコードを
      # user_roomsに代入。
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    if user_rooms.nil? # 上記で取得できなかった場合の処理
      # 新しいroomを作成して保存
      @room = Room.new
      @room.save
      # @room.idと@user.idをUserRoomのカラムに保存(１レコード)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
      # @room.idとcurrent_user.idをUserRoomのカラムに保存(１レコード)
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
    else
      # 取得している場合は、user_roomsに紐づいているroomテーブルのレコードを@roomに代入
      @room = user_rooms.room
    end
    # if文の中で定義した@roomに紐づくchatsテーブルのレコードを代入
    @chats = @room.chats
    # @room.idを代入したChat.newを用意しておく(message送信時のform用)←筆者の表現が合っているか分かりません、、
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
    @chat.create_notification_chat!(current_user)
    # チャットの通知
  end

  private

  def chat_params
    params.require(:chat).permit(:sentence, :room_id)
  end
end
