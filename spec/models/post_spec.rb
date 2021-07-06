# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do

describe 'postモデルのテスト' do

  it "postの登録内容の場合は保存されるか" do
    user = FactoryBot.create(:user)
    post = Post.new(name: "テスト", body: "テストです。", user_id: user.id)
    expect(post).to be_valid
  end
  it "postのnameが入っていない場合、エラーとなるか" do
    user = FactoryBot.create(:user)
    post = Post.new(name: "", body: "テストです。", user_id: user.id)
    expect(post).to be_invalid
  end
  it "postのbodyが入っていない場合、エラーとなるか" do
    user = FactoryBot.create(:user)
    post = Post.new(name: "テスト", body: "", user_id: user.id)
    expect(post).to be_invalid
  end
  it 'UserモデルとN:1となっている' do
    expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
  end
 end
end