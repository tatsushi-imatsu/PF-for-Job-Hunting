# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do

describe 'favoriteモデルのテスト' do
  it "有効な登録内容の場合は保存されるか" do
    expect(FactoryBot.create(:favorite)).to be_valid
  end
  context 'postモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
 end
end