# frozen_string_literal: true

require 'rails_helper'

describe 'adminモデルのテスト' do

  it "emailが空白の場合にログインできないことの確認" do
    admin = Admin.new(email: "", password: "example", password_confirmation: "example")
    expect(admin).to be_invalid
  end

  it "passwordが空白の場合にログインできないことの確認" do
    admin = Admin.new(email: "taro@example", password: "", password_confirmation: "example")
    expect(admin).to be_invalid
  end

  it "password_confirmationが空白の場合にログインできないことの確認" do
    admin = Admin.new(email: "taro@example", password: "example", password_confirmation: "")
    expect(admin).to be_invalid
  end


end