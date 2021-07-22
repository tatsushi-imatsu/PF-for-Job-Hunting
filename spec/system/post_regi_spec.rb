
require 'rails_helper'

describe '投稿処理のテスト', type: :system do
        let(:user) { create(:user) }
        let(:post) { create(:post) }
        before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        end
        context '投稿内容登録確認' do
        it '投稿が正しく保存される' do
           fill_in 'post[name]', with: Faker::Lorem.characters(number: 5)
           fill_in 'post[body]', with: Faker::Lorem.characters(number: 20)
           expect { click_button 'Share!' }.to change(Post.all, :count).by(1)
        end
        # it '投稿した単語が表示される' do
        #   fill_in 'post[name]', with: Faker::Lorem.characters(number: 5)
        #   fill_in 'post[body]', with: Faker::Lorem.characters(number: 20)
        #   expect { click_button 'Share!' }.to change(Post.all, :count).by(1)
        #   expect(page).to have_content post.name(1)
        # end
        end
end