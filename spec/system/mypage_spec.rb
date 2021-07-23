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
    it 'プロフィール編集URLが正しい' do
    expect(page).to have_link "", href: edit_user_path(user)
    end
    it '退会するURLが正しい' do
    expect(page).to have_link "", href: user_withdraw_path(user)
    end
    it '通知URLが正しい' do
    expect(page).to have_link "", href: notifications_path
    end
    # it 'フォローするボタンが表示されている' do
    # expect(page).to have_button 'フォローする'
    # end
    it "マイページに がいいねした Words 〜 my favorite words〜" do
    expect(page).to have_content 'がいいねした Words 〜 my favorite words〜'
    end
    # it '投稿詳細URLが正しい' do
    # click_link users_link
    # expect(page).to have_link "post_path(post)", href: '/posts/'
    # end

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
    # is_expected.to eq '/users/' + user.id.to_s
    click_link 'プロフィール編集 Edit profile'
  end
  describe 'プロフィール編集' do
  context '更新成功のテスト' do
    subject { current_path }
      it "ユーザ情報編集 〜 Edit my profile 〜が表示されている" do
      expect(page).to have_content 'ユーザ情報編集 〜 Edit my profile 〜'
      end
      it '画像編集フォームが表示される' do
        expect(page).to have_field 'user[image]'
      end
      it 'last_nameが表示される' do
        expect(page).to have_field 'user[last_name]'
      end
      it 'first_nameが表示される' do
        expect(page).to have_field 'user[first_name]'
      end
      it 'last_name_kanaが表示される' do
        expect(page).to have_field 'user[last_name_kana]'
      end
      it 'first_name_kanaが表示される' do
        expect(page).to have_field 'user[first_name_kana]'
      end
      it 'introductionが正しく更新される' do
       fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 19)
       click_button '保存'
      end
      # it 'リダイレクト先が、自分のユーザ詳細画面になっている' do
      #   click_button '保存'
      #   expect(current_path).to eq '/users/' + user.last.id.to_s
      # end
    end
  end
end
