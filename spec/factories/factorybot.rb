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
end