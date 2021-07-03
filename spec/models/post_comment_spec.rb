# # frozen_string_literal: true

require 'rails_helper'

describe 'post_commentモデルのテスト' do
  it "有効な登録内容の場合は保存されるか" do
    expect(FactoryBot.build(:post_comment)).to be_valid
  end
  it "contentが空白の場合エラーとなるか" do
    user = FactoryBot.create(:user)
    post_comment = PostComment.new(comment: '', user_id: user.id)
    expect(post_comment).to be_invalid
  end
  # context 'commentカラム' do
  #     it '100文字以下であること: 99文字は〇' do
  #       comment = Faker::Lorem.characters(number: 99)
  #       is_expected.to eq true
  #     end
  #     it '100文字以下であること: 101文字は×' do
  #       comment = Faker::Lorem.characters(number: 101)
  #       is_expected.to eq false
  #     end
  # end
end