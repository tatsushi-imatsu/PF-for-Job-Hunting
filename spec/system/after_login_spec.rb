require 'rails_helper'

RSpec.describe "AfterLogins", type: :system do
  describe 'ログイン後のテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    context '表示内容の確認' do
       it 'ログイン後のリダイレクト先が、投稿一覧画面になっている' do
        expect(current_path).to eq '/posts'
      end
    end

    describe 'ログイン後: ヘッダーのテスト' do


        it 'word shareロゴが表示される' do
          expect(page).to have_content 'word share'
        end

        it 'Mypage:ハンバーガーメニュー上から1番目のリンク' do
          mypage_link = find_all('a')[1].native.inner_text
          expect(mypage_link).to match "My page マイページ"
        end
        end
        it 'Share words:ハンバーガーメニュー上から2番目のリンク' do
          sharewords_link = find_all('a')[2].native.inner_text
          expect(sharewords_link).to match "Share  words 単語を共有しよう"
        end
        it 'Log out:ハンバーガーメニュー上から3番目のリンク' do
          logout_link = find_all('a')[3].native.inner_text
          expect(logout_link).to match "Log out ログアウト"
        end

        context '表示の確認' do

          it '言葉をシェアして繋がりましょう！が表示される' do
          expect(page).to have_content '言葉をシェアして繋がりましょう！'
          end

          it '言葉フォームが表示される' do
          expect(page).to have_field 'post_name'
          end

          it '言葉フォームに値が入っていない' do
          expect(find_field('post[name]').text).to be_blank
          end

          it '意味・説明フォームが表示される' do
          expect(page).to have_field 'post_body'
          end

          it '意味・説明フォームに値が入っていない' do
          expect(find_field('post[body]').text).to be_blank
          end

          it 'Shareボタンが表示されている' do
          expect(page).to have_button 'Share!'
          end
          it '総合ランキングが表示される' do
          expect(page).to have_content "総合ランキング"
          end
          it 'マイランキング：と表示される' do
          expect(page).to have_content "マイランキング"
          end
          it '完全一致と表示される' do
          expect(page).to have_content "完全一致"
          end
          it 'Wordと表示される' do
          expect(page).to have_content "Word"
          end
          it '完全一致と表示される' do
          expect(page).to have_content "完全一致"
          end
          it '前方一致と表示される' do
          expect(page).to have_content "前方一致"
          end
          it '後方一致と表示される' do
          expect(page).to have_content "後方一致"
          end
          it '部分一致と表示される' do
          expect(page).to have_content "部分一致"
          end
          it '検索ボタンが表示されている' do
          expect(page).to have_button '検索'
          end
          it 'お問い合わせボタンが表示されている' do
          expect(page).to have_content 'お問い合わせ'
          end
      end
    end


  end