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

      # context '表示内容' do
        it 'word shareロゴが表示される' do
          expect(page).to have_content 'word share'
        end

        it 'Mypage:ハンバーガーメニュー上から1番目のリンク' do
          mypage_link = find_all('a')[1].native.inner_text
          expect(mypage_link).to match "My page マイページ"
        end
        # it 'Mypageを押すと、Mypage画面に遷移する' do
        # mypage_link = find_all('a')[1].native.inner_text
        # mypage_link.gsub!(/\n/, '')
        # click_link mypage_link
        # is_expected.to eq '/users/' + user.id.to_s
        # end
        end
        it 'Share words:ハンバーガーメニュー上から2番目のリンク' do
          sharewords_link = find_all('a')[2].native.inner_text
          expect(sharewords_link).to match "Share  words 単語を共有しよう"
        end
        # it 'Share wordsを押すと、Share words画面に遷移する' do
        # sharewords_link = find_all('a')[2].native.inner_text
        # sharewords_link.gsub!(/\n/, '')
        # click_link sharewords_link
        # is_expected.to eq '/posts'
        # end
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

          it '意味・説明フォームが表示される' do
          expect(page).to have_field 'post_body'
          end

          it 'Shareボタンが表示されている' do
          expect(page).to have_button 'Share!'
          end
          it '総合ランキングが表示される' do
          expect(page).to have_content "総合ランキング"
          end
          # it '総合ランキング:No.が表示される' do
          # expect(page).to have_text "No."
          # end
          # it '総合ランキング：いいね数が表示される' do
          # expect(page).to have_content "いいね数"
          # end
          it 'マイランキング：と表示される' do
          expect(page).to have_content "マイランキング"
          end
          it 'お問い合わせボタンが表示されている' do
          expect(page).to have_content 'お問い合わせ'
          end
      end
    end

      
  end