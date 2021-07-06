# # frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostComment, type: :model do

describe 'post_commentモデルのテスト' do
  it "有効な登録内容の場合は保存されるか" do
    expect(FactoryBot.build(:post_comment)).to be_valid
  end
  it "contentが空白の場合エラーとなるか" do
    user = FactoryBot.create(:user)
    post_comment = PostComment.new(comment: '', user_id: user.id)
    expect(post_comment).to be_invalid
  end
    context 'postモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  context 'commentカラム' do
  #     it '100文字以下であること: 99文字は〇' do
  #       user = FactoryBot.create(:user)
  #       # post = Post.new(name: "テスト", body: "テストです。", user_id: user.id)
  #       post_comment = PostComment.new(comment: "a" * 99, user_id: user.id)
  #       expect(post_comment).to be_valid
  #     end
      it '100文字以下であること: 101文字は×' do
        user = FactoryBot.create(:user)
        post_comment = PostComment.new(comment: "a" * 101, user_id: user.id)
        expect(post_comment).to be_invalid
      end
  end
 end
end