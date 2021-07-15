require 'rails_helper'

describe 'Mypageのテスト', type: :system do
  let(:user) { create(:user) }
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
    it '自分の画像が表示される' do
      expect(all('img').size).to eq(2)
    end
    it "マイページにNAMEが表示されている" do
    expect(page).to have_content 'N A M E'
    end
    it "マイページにINTRODUCTIONが表示されている" do
    expect(page).to have_content 'I N T R O D U C T I O N'
    end
    it "マイページにフォローしている人数 〜Your following〜が表示されている" do
    expect(page).to have_content 'フォローしている人数 〜Your following〜'
    end
    it "マイページに※チャット可能 〜Chat available〜   が表示されている" do
    expect(page).to have_content '※チャット可能 〜Chat available〜'
    end
    it "マイページにフォローされている人数 〜Your followers〜が表示されている" do
    expect(page).to have_content 'フォローされている人数 〜Your followers〜'
    end
    it "マイページに会員状態 〜Current status〜が表示されている" do
    expect(page).to have_content '会員状態 〜Current status〜'
    end
    it "マイページに がいいねした Words 〜 my favorite words〜" do
    expect(page).to have_content 'がいいねした Words 〜 my favorite words〜'
    end
  end
end

end

  
# プロフィール編集 Edit profile 退会する Quit 通知 NOTICE\n◆ n2u3hn2cbt 6ne1tpp6b0 がいいねした Words 〜 my favorite words〜\nお