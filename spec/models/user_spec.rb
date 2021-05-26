# frozen_string_literal: true

require 'rails_helper'

describe 'userモデルのテスト' do
  
  it "有効な登録内容の場合は保存されるか" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  
  it "emailが空白の場合に空白のバリデーションチェックが行われるか" do
    user = User.new(last_name: "テスト", first_name: "太郎", last_name_kana: "test", first_name_kana: "taro", email: "", password: "example", password_confirmation: "example")
    expect(user).to be_invalid
  end
  
  it "last_name が空白の場合に空白のバリデーションチェックが行われるか" do
    user = User.new(last_name: "", first_name: "太郎", last_name_kana: "test", first_name_kana: "taro", email: "taro@example", password: "example", password_confirmation: "example")
    expect(user).to be_invalid
  end
  
  it "first_name が空白の場合に空白のバリデーションチェックが行われるか" do
    user = User.new(last_name: "テスト", first_name: "", last_name_kana: "test", first_name_kana: "taro", email: "taro@example", password: "example", password_confirmation: "example")
    expect(user).to be_invalid
  end
  
  it "last_name_kana が空白の場合に空白のバリデーションチェックが行われるか" do
    user = User.new(last_name: "テスト", first_name: "太郎", last_name_kana: "", first_name_kana: "taro", email: "taro@example", password: "example", password_confirmation: "example")
    expect(user).to be_invalid
  end
  
  it "first_name_kana が空白の場合に空白のバリデーションチェックが行われるか" do
    user = User.new(last_name: "テスト", first_name: "太郎", last_name_kana: "test", first_name_kana: "", email: "taro@example", password: "example", password_confirmation: "example")
    expect(user).to be_invalid
  end
  
  it "passwordが空白の場合に空白のバリデーションチェックが行われるか" do
    user = User.new(last_name: "テスト", first_name: "太郎", last_name_kana: "test", first_name_kana: "taro", email: "taro@example", password: "", password_confirmation: "example")
    expect(user).to be_invalid
  end
  
  it "password_confirmationが空白の場合に空白のバリデーションチェックが行われるか" do
    user = User.new(last_name: "テスト", first_name: "太郎", last_name_kana: "test", first_name_kana: "taro", email: "taro@example", password: "example", password_confirmation: "")
    expect(user).to be_invalid
  end


end