describe 'ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    let(:post) { create(:post) }
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'Log inリンクが表示される: ハンバーガーメニュー上から4番目のリンクが「Log in」である' do
        log_in_link = find_all('a')[4].native.inner_text
        expect(log_in_link).to match(/log in/i)
      end
      it 'Log inリンクの内容が正しい' do
        log_in_link = find_all('a')[4].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
      end
      it 'Sign Upリンクが表示される: ハンバーガーメニュー上から3番目のリンクが「Join 新規登録」である' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(sign_up_link).to match(/join/i)
      end
      it 'Sign Upリンクの内容が正しい' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(page).to have_link sign_up_link, href: new_user_registration_path
      end
      it 'Word Share!が表示される' do
        expect(page).to have_content "Word Share!"
      end
      it '〜 Words Sharing Community 〜が表示される' do
        expect(page).to have_content "〜 Words Sharing Community 〜"
      end
      it 'Words tweeting 言葉をつぶやいた後 が表示される' do
        expect(page).to have_content "Words tweeting 言葉をつぶやいた後"
      end
      it 'Sharing with words 共有することで が表示される' do
        expect(page).to have_content "Sharing with words 共有することで"
      end
      it 'Communication 交流しましょう！! が表示される' do
        expect(page).to have_content "Communication 交流しましょう！!"
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/home/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/home/about'
      end
      it '左上ロゴと画像が表示される' do
      expect(all('img').size).to eq(4)
      end
      it 'Word Shareの使い方〜How to use〜が表示される' do
        expect(page).to have_content "Word Shareの使い方〜How to use〜"
      end
      it '言葉と意味をセットで投稿できます。総合ランキングでは全体のいいね数が多い順番で表示されます。' do
        expect(page).to have_content "言葉と意味をセットで投稿できます。総合ランキングでは全体のいいね数が多い順番で表示されます。"
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'Word Share'
      end
      it 'Homeリンクが表示される: ハンバーガーメニュー上から1番目のリンクが「Home」である' do
        home_link = find_all('a')[1].native.inner_text
        expect(home_link).to match(/home/i)
      end
      it 'Aboutリンクが表示される: ハンバーガーメニュー上から2番目のリンクが「How to share」である' do
        about_link = find_all('a')[2].native.inner_text
        expect(about_link).to match(/how to share/i)
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'Homeを押すと、トップ画面に遷移する' do
        home_link = find_all('a')[1].native.inner_text
        home_link.gsub!(/\n/, '')
        click_link home_link
        is_expected.to eq '/'
      end
      it 'Aboutを押すと、How to share画面に遷移する' do
        about_link = find_all('a')[2].native.inner_text
        about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link about_link
        is_expected.to eq '/home/about'
      end
      it 'sign upを押すと、新規登録画面に遷移する' do
        signup_link = find_all('a')[3].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link
        is_expected.to eq '/users/sign_up'
      end
      it 'loginを押すと、ログイン画面に遷移する' do
        login_link = find_all('a')[4].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link
        is_expected.to eq '/users/sign_in'
      end
    end


  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「JOIN」と表示される' do
        expect(page).to have_content 'JOIN'
      end
      it 'last_nameフォームが表示される' do
        expect(page).to have_field 'user[last_name]'
      end
      it 'last_nameフォームに値が入っていない' do
        expect(find_field('user[last_name]').text).to be_blank
      end
      it 'first_nameフォームが表示される' do
        expect(page).to have_field 'user[first_name]'
      end
      it 'first_nameフォームに値が入っていない' do
        expect(find_field('user[first_name]').text).to be_blank
      end
      it 'last_name_kanaフォームが表示される' do
        expect(page).to have_field 'user[last_name_kana]'
      end
      it 'last_name_kanaフォームに値が入っていない' do
        expect(find_field('user[last_name_kana]').text).to be_blank
      end
      it 'first_name_kanaフォームが表示される' do
        expect(page).to have_field 'user[first_name_kana]'
      end
      it 'first_name_kanaフォームに値が入っていない' do
        expect(find_field('user[first_name_kana]').text).to be_blank
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'emailフォームに値が入っていない' do
        expect(find_field('user[email]').text).to be_blank
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'passwordフォームに値が入っていない' do
        expect(find_field('user[password]').text).to be_blank
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it 'password_confirmationフォームに値が入っていない' do
        expect(find_field('user[password_confirmation]').text).to be_blank
      end
      it 'Join!ボタンが表示される' do
        expect(page).to have_button 'Join!'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[last_name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[first_name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[last_name_kana]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[first_name_kana]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button 'Join!' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、投稿一覧になっている' do
        click_button 'Join!'
        expect(current_path).to eq '/posts'
      end
    end
  end

  describe 'ユーザログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「LOG IN」と表示される' do
        expect(page).to have_content 'LOG IN'
      end
      it 'last_nameフォームが表示されない' do
        expect(page).not_to have_field 'user[last_name]'
      end
      it 'first_nameフォームが表示されない' do
        expect(page).not_to have_field 'user[first_name]'
      end
      it 'last_name_kanaフォームが表示されない' do
        expect(page).not_to have_field 'user[last_name_kana]'
      end
      it 'first_name_kanaフォームが表示されない' do
        expect(page).not_to have_field 'user[first_name_kana]'
      end
      it 'emailフォームは表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end

    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、投稿一覧画面になっている' do
        expect(current_path).to eq '/posts'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'word share'
      end
    end


  describe 'ユーザログアウトのテスト' do
    let(:user) { create(:user) }

    before do
      logout_link = find_all('a')[3].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
   end
  end
 end
end