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
      it 'nameフォームが表示される' do
      expect(page).to have_field 'inquiry[name]'
      end
      it 'nameに値が入っていない' do
      expect(find_field('inquiry[name]').text).to be_blank
      end
      it "メールアドレスが表示されている" do
      expect(page).to have_content 'メールアドレス'
      end
      it "（必須）が表示されている" do
      expect(page).to have_content '（必須）'
      end
      it 'emailフォームが表示される' do
      expect(page).to have_field 'inquiry[email]'
      end
      it 'emailに値が入っていない' do
      expect(find_field('inquiry[email]').text).to be_blank
      end
      it "内容（5文字以上入力してください。）が表示されている" do
      expect(page).to have_content '内容（5文字以上入力してください。）'
      end
      it 'messageフォームが表示される' do
      expect(page).to have_field 'inquiry[message]'
      end
      it 'messageに値が入っていない' do
      expect(find_field('inquiry[message]').text).to be_blank
      end
      it '確認ボタンが表示される' do
      expect(page).to have_button '確認'
      end
      it "文字が表示されている" do
      expect(page).to have_content '文字'
      end
    end
end

# describe '問い合わせ（確認画面）のテスト' do
#     before do
#       visit inquiry_path
#     end
#       context '問い合わせ成功' do
#       subject { current_path }
#     it '正しく確認画面へ移行する' do
#       fill_in Inquiry.name, with: Faker::Lorem.characters(number: 5)
#       fill_in 'email', with: Faker::Internet.email
#       fill_in 'message', with: Faker::Lorem.characters(number: 10)
#       expect { click_button '確認' }.to change(inquiry.all, :count).by(1)
#       expect(current_path).to eq '/inquiry/confirm'
#     end
#   end
# end

