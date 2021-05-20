class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
  validates :message, :presence => {:message => '5文字以上で内容を入力してください'}, length: { minimum: 5 }
end