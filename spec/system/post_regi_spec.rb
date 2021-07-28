
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
        subject { current_path }
        it '投稿が正しく保存される' do
           fill_in 'post[name]', with: Faker::Lorem.characters(number: 5)
           fill_in 'post[body]', with: Faker::Lorem.characters(number: 20)
           expect { click_button 'Share!' }.to change(Post.all, :count).by(1)
        end
        end
end

 describe '自分の投稿詳細画面のテスト' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      fill_in 'post[name]', with: Faker::Lorem.characters(number: 5)
      fill_in 'post[body]', with: Faker::Lorem.characters(number: 20)
      visit post_path(post)
    end

    context '表示内容の確認' do
     subject { current_path }
      it 'URLが正しい' do
        expect(current_path).to eq '/posts/' + Post.last.id.to_s
      end
      it 'いいねやコメントをしてコミュニケーションしましょう！と表示される' do
        expect(page).to have_content 'いいねやコメントをしてコミュニケーションしましょう！'
      end
      it '〜Push button and leave comments!〜が表示される' do
        expect(page).to have_content '〜Push button and leave comments!〜'
      end
      it '意味(explanation)が表示される' do
        expect(page).to have_content '意味(explanation)'
      end
      it 'Shared byが表示される' do
        expect(page).to have_content 'Shared by'
      end
      it 'コメント件数：が表示される' do
        expect(page).to have_content 'コメント件数：'
      end
      it '0文字が表示される' do
        expect(page).to have_content '0文字'
      end
#       it '投稿の編集リンクが表示される' do
#         expect(page).to have_link 'Edit', href: edit_book_path(book)
#       end
#       it '投稿の削除リンクが表示される' do
#         expect(page).to have_link 'Destroy', href: book_path(book)
      end
    end