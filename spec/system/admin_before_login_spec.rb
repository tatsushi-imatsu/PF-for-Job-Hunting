describe '管理人ログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit new_admin_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/admins/sign_in'
      end
      it 'Log inリンクが表示される' do
        log_in_link = find_all('a')[1].native.inner_text
        expect(log_in_link).to match(/ログイン/i)
      end
      it 'Log inリンクの内容が正しい' do
        log_in_link = find_all('a')[1].native.inner_text
        expect(page).to have_link log_in_link, href: new_admin_session_path
      end
      it 'loginを押すと、ログイン画面に遷移する' do
        login_link = find_all('a')[1].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      new_admin_session_path
    end

  describe '管理人ログイン' do
    let(:admin) { create(:admin) }

    before do
      visit new_admin_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/admins/sign_in'
      end
      it '「管理者ログイン」と表示される' do
        expect(page).to have_content '管理者ログイン'
      end
      it 'emailフォームは表示される' do
        expect(page).to have_field 'admin[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'admin[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end

    end

#     context 'ログイン成功のテスト' do
#       before do
#         fill_in 'user[email]', with: user.email
#         fill_in 'user[password]', with: user.password
#         click_button 'ログイン'
#       end

#       it 'ログイン後のリダイレクト先が、投稿一覧画面になっている' do
#         expect(current_path).to eq '/posts'
#       end
#     end

#     context 'ログイン失敗のテスト' do
#       before do
#         fill_in 'user[email]', with: ''
#         fill_in 'user[password]', with: ''
#         click_button 'ログイン'
#       end

#       it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
#         expect(current_path).to eq '/users/sign_in'
#       end
#     end
#   end

#   describe 'ヘッダーのテスト: ログインしている場合' do
#     let(:user) { create(:user) }

#     before do
#       visit new_user_session_path
#       fill_in 'user[email]', with: user.email
#       fill_in 'user[password]', with: user.password
#       click_button 'ログイン'
#     end

#     context 'ヘッダーの表示を確認' do
#       it 'タイトルが表示される' do
#         expect(page).to have_content 'word share'
#       end
#     end


#   describe 'ユーザログアウトのテスト' do
#     let(:user) { create(:user) }

#     before do
#       logout_link = find_all('a')[3].native.inner_text
#       logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
#       click_link logout_link
#     end

#     context 'ログアウト機能のテスト' do
#       it 'ログアウト後のリダイレクト先が、トップになっている' do
#         expect(current_path).to eq '/'
#       end
#     end
#   end
   end
  end
end