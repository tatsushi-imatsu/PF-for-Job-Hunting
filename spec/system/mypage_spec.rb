require 'rails_helper'

describe 'Mypageのテスト', type: :system do
  let(:user) { create(:user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
  describe 'ヘッダーのテスト: ログインしている場合' do
   context 'リンクの内容を確認' do
     subject { current_path }
    it 'ログイン後のリダイレクト先が、投稿一覧画面になっている' do
      expect(current_path).to eq '/posts'
    end
    it 'Mypageを押すと、Mypage画面に遷移する' do
      mypage_link = find_all('a')[1].native.inner_text
      mypage_link.gsub!(/\n/, '')
      click_link mypage_link
      is_expected.to eq '/users/' + user.id.to_s
    end
    it '自分の画像が表示される' do
      expect(all('img').size).to eq(1)
    end
    
  end
end

end