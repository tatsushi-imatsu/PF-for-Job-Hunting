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
      it "メールアドレスが表示されている" do
      expect(page).to have_content 'メールアドレス'
      end
      it "内容が表示されている" do
      expect(page).to have_content '内容'
      end

    end
end