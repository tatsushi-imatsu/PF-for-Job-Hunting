require 'rails_helper'

describe 'Mypageのテスト', type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
    mypage_link = find_all('a')[1].native.inner_text
    mypage_link.gsub!(/\n/, '')
    click_link mypage_link
    is_expected.to eq '/users/' + user.id.to_s
  end
  describe 'ヘッダーのテスト: ログインしている場合' do
   context 'リンクの内容を確認' do
     subject { current_path }
    it 'Mypageを押すと、Mypage画面に遷移する' do
        mypage_link = find_all('a')[1].native.inner_text
        mypage_link.gsub!(/\n/, '')
        click_link mypage_link
        is_expected.to eq '/users/' + user.id.to_s
    end
    it '左上ロゴと自分の画像が表示される' do
      expect(all('img').size).to eq(2)
    end
    it "マイページにNAMEが表示されている" do
    expect(page).to have_content 'N A M E'
    end
    it "マイページにlast_name_kanaが表示されている" do
    expect(page).to have_content user.last_name_kana
    end
    it "マイページにfirst_name_kanaが表示されている" do
    expect(page).to have_content user.first_name_kana
    end
    it "マイページにINTRODUCTIONが表示されている" do
    expect(page).to have_content 'I N T R O D U C T I O N'
    end
    it "マイページにuser.introductionが表示されている" do
    expect(page).to have_content user.introduction
    end
    it "マイページにフォローしている人数 〜Your following〜が表示されている" do
    expect(page).to have_content 'フォローしている人数 〜Your following〜'
    end
    # it "マイページに※チャット可能 〜Chat available〜   が表示されている" do
    # expect(page).to have_content '※チャット可能 〜Chat available〜'
    # end
    it "マイページにフォローされている人数 〜Your followers〜が表示されている" do
    expect(page).to have_content 'フォローされている人数 〜Your followers〜'
    end
    it "マイページに会員状態 〜Current status〜が表示されている" do
    expect(page).to have_content '会員状態 〜Current status〜'
    end
    it "マイページに利用中 〜valid〜が表示されている" do
    expect(page).to have_content '利用中 〜valid〜'
    end
    it '退会 〜invalid〜は表示されない' do
    expect(page).to have_no_content "退会 〜invalid〜"
    end
    it 'プロフィール編集URLが正しい' do
    expect(page).to have_link "", href: edit_user_path(user)
    end
    it '退会するURLが正しい' do
    expect(page).to have_link "", href: user_withdraw_path(user)
    end
    it '通知URLが正しい' do
    expect(page).to have_link "", href: notifications_path
    end
    it "マイページに がいいねした Words 〜 my favorite words〜" do
    expect(page).to have_content 'がいいねした Words 〜 my favorite words〜'
    end
  end
end

end

describe 'Mypage編集のテスト', type: :system do
  let(:user) { create(:user) }
  before do
    visit new_user_registration_path
    fill_in 'user[last_name]', with: Faker::Lorem.characters(number: 10)
    fill_in 'user[first_name]', with: Faker::Lorem.characters(number: 10)
    fill_in 'user[last_name_kana]', with: Faker::Lorem.characters(number: 10)
    fill_in 'user[first_name_kana]', with: Faker::Lorem.characters(number: 10)
    fill_in 'user[email]', with: Faker::Internet.email
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Join!'
    mypage_link = find_all('a')[1].native.inner_text
    mypage_link.gsub!(/\n/, '')
    click_link mypage_link
    click_link 'プロフィール編集 Edit profile'
  end
  describe 'プロフィール編集' do
  context '更新成功のテスト' do
    subject { current_path }
      it 'URLが正しい' do
      expect(current_path).to eq '/users/' + User.last.id.to_s + '/edit'
      end
      it "ユーザ情報編集 〜 Edit my profile 〜が表示されている" do
      expect(page).to have_content "ユーザ情報編集 〜 Edit my profile 〜"
      end
      it "名前　姓が表示されている" do
      expect(page).to have_content "名前　姓"
      end
      it 'last_nameが表示される' do
      expect(page).to have_field 'user[last_name]'
      end
      it "名が表示されている" do
      expect(page).to have_content "名"
      end
      it 'first_nameが表示される' do
      expect(page).to have_field 'user[first_name]'
      end
      it "ローマ字（半角）姓が表示されている" do
      expect(page).to have_content "ローマ字（半角）姓"
      end
      it 'last_name_kanaが表示される' do
      expect(page).to have_field 'user[last_name_kana]'
      end
      it "ローマ字（半角）名 が表示されている" do
      expect(page).to have_content "ローマ字（半角）名"
      end
      it 'first_name_kanaが表示される' do
      expect(page).to have_field 'user[first_name_kana]'
      end
      it "紹介文が表示されている" do
      expect(page).to have_content "紹介文"
      end
      it 'introductionが表示される' do
      expect(page).to have_field 'user[introduction]'
      end
      it 'introductionに値が入っていない' do
      expect(find_field('user[introduction]').text).to be_blank
      end
      it "0文字が表示されている" do
      expect(page).to have_content "0文字"
      end
      it "プロフィール画像が表示されている" do
      expect(page).to have_content "プロフィール画像"
      end
      it '画像編集フォームが表示される' do
      expect(page).to have_field 'user[image]'
      end
      it '保存ボタンが表示されている' do
      expect(page).to have_button '保存'
      end
      it 'introductionが正しく更新される' do
      fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 19)
      click_button '保存'
      end
      it '更新後の遷移先URLが正しい' do
      click_button '保存'
      expect(current_path).to eq '/users/' + User.last.id.to_s
      end
    end
  end
end

  describe 'Mypage退会のテスト', type: :system do
  let(:user) { create(:user) }
  before do
    visit new_user_registration_path
    fill_in 'user[last_name]', with: Faker::Lorem.characters(number: 10)
    fill_in 'user[first_name]', with: Faker::Lorem.characters(number: 10)
    fill_in 'user[last_name_kana]', with: Faker::Lorem.characters(number: 10)
    fill_in 'user[first_name_kana]', with: Faker::Lorem.characters(number: 10)
    fill_in 'user[email]', with: Faker::Internet.email
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Join!'
    mypage_link = find_all('a')[1].native.inner_text
    mypage_link.gsub!(/\n/, '')
    click_link mypage_link
    click_link '退会する Quit'
  end
  describe '退会' do
  context '退会成功のテスト' do
    subject { current_path }
      it 'URLが正しい' do
      expect(current_path).to eq '/users/' + User.last.id.to_s + '/withdraw'
      end
      it "退会確認が表示されている" do
      expect(page).to have_content "退会確認"
      end
      it "本当に退会してもよろしいでしょうか？が表示されている" do
      expect(page).to have_content "本当に退会してもよろしいでしょうか？"
      end
      it '退会するURLが正しい' do
      click_link '退会する'
      is_expected.to eq '/'
      end
      it '退会しない' do
      click_link '退会しない'
      expect(current_path).to eq '/users/' + User.last.id.to_s
      end
    end
  end
end