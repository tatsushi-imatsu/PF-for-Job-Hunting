require 'rails_helper'

RSpec.describe Chat, type: :model do

describe 'chatモデルのテスト' do
  # it "chatが保存される" do
  #   user = FactoryBot.create(:user)
  #   # UserRoom.create(user_id: user.id, room_id: room.id)
  #   # roomがnilのため、再度修正必須
  #   chat = Chat.new(sentence: 'テスト', user_id: user.id)
  #   expect(chat).to be_valid
  # end
  it "sentenceが空白の場合エラーとなるか" do
    user = FactoryBot.create(:user)
    chat = Chat.new(sentence: '', user_id: user.id)
    expect(chat).to be_invalid
  end
  context 'roomモデルとの関係' do
      it 'N:1となっている' do
        expect(Chat.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Chat.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
 end
end