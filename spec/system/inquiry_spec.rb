require 'rails_helper'

describe '問い合わせのテスト' do
    before do
      visit inquiry_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/inquiry'
      end
      it "お問い合わせが表示されている" do
      expect(page).to have_content 'お問い合わせ'
      end
      it "名前が表示されている" do
      expect(page).to have_content '名前'
      end
      it "（必須）が表示されている" do
      expect(page).to have_content '（必須）'
      end
      it "メールアドレスが表示されている" do
      expect(page).to have_content 'メールアドレス'
      end
      it "（必須）が表示されている" do
      expect(page).to have_content '（必須）'
      end
      it "内容（5文字以上入力してください。）が表示されている" do
      expect(page).to have_content '内容（5文字以上入力してください。）'
      end
      it '確認ボタンが表示される' do
      expect(page).to have_button '確認'
      end
      it "文字が表示されている" do
      expect(page).to have_content '文字'
      end
    end
end