# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, type: :model do

describe 'Notificationモデルのテスト' do

  it 'PostモデルとN:1となっている' do
    expect(Notification.reflect_on_association(:post).macro).to eq :belongs_to
  end
  it 'PostcommentモデルとN:1となっている' do
    expect(Notification.reflect_on_association(:post_comment).macro).to eq :belongs_to
  end
  it 'VisiterとN:1となっている' do
    expect(Notification.reflect_on_association(:visiter).macro).to eq :belongs_to
  end
  it 'VisitedとN:1となっている' do
    expect(Notification.reflect_on_association(:visited).macro).to eq :belongs_to
  end
  it 'RoomモデルとN:1となっている' do
    expect(Notification.reflect_on_association(:room).macro).to eq :belongs_to
  end
  it 'messageとN:1となっている' do
    expect(Notification.reflect_on_association(:message).macro).to eq :belongs_to
  end

 end
end