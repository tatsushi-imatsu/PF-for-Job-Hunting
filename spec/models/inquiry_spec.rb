require 'rails_helper'

RSpec.describe Inquiry, type: :model do

describe 'inquiryモデルのテスト' do

  it "inquiryの登録内容の場合は保存されるか" do
    inquiry = Inquiry.new(name: "テスト太郎", email: "abcde@fghi", message: "これはテストです")
    expect(inquiry).to be_valid
  end
  it "inquiryのnameが入っていない場合、空白のバリデーションチェックが行われるか" do
    inquiry = Inquiry.new(name: "", email: "abcde@fghi", message: "これはテストです")
    expect(inquiry).to be_invalid
  end
  it "inquiryのemailが入っていない場合、空白のバリデーションチェックが行われるか" do
    inquiry = Inquiry.new(name: "テスト太郎", email: "", message: "これはテストです")
    expect(inquiry).to be_invalid
  end
  it "inquiryのmessageが入っていない場合、空白のバリデーションチェックが行われるか" do
    inquiry = Inquiry.new(name: "テスト太郎", email: "abcde@fghi", message: "")
    expect(inquiry).to be_invalid
  end
  it "inquiryのmessageが四文字以下の場合、バリデーションチェックが行われるか" do
    inquiry = Inquiry.new(name: "テスト太郎", email: "abcde@fghi", message: "aaaa")
    expect(inquiry).to be_invalid
  end
  it "inquiryのmessageが五文字以上の場合、保存が行われるか" do
    inquiry = Inquiry.new(name: "テスト太郎", email: "abcde@fghi", message: "aaaaa")
    expect(inquiry).to be_valid
  end
 end
end