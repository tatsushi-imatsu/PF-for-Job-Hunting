# frozen_string_literal: true

require 'rails_helper'

describe 'Users', type: :request do
  before do
    # 登録しているuserを使うのでcreateとします。
    @user = FactoryBot.create(:user)
    # deviseのメソッドであるsign_inでログインしています。
    sign_in @user
  end

  after do
    sign_out @user
  end
end