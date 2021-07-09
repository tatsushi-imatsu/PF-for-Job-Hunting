FactoryBot.define do
  password = Faker::Internet.password(min_length: 6)
    # unique_codeは自動生成される
  factory :user do
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
    last_name { Faker::Lorem.characters(number: 10) }
    first_name { Faker::Lorem.characters(number: 10) }
    last_name_kana { Faker::Lorem.characters(number: 10) }
    first_name_kana { Faker::Lorem.characters(number: 10) }
    # メール認証をパスするための記述
    # confirmed_at { Date.today }
  end
  factory :admin do
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
  FactoryBot.define do
  factory :post do
    name { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 20) }
    user
  end
end
  factory :post_comment do
    association :post
    user { post.user }
    comment { Faker::Lorem.characters(number: 20) }
  end
  factory :favorite do
    association :post
    user { post.user }
  end
  factory :chat do
    association :user
    user { chat.user }
    sentence { Faker::Lorem.characters(number: 20) }
  end
  factory :room do
    association :chat
    user { room.chat }
  end
  factory :inquiry do
    name { Faker::Lorem.characters(number: 5) }
    email { Faker::Internet.email }
    message { Faker::Lorem.characters(number: 10) }
  end
end