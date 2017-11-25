FactoryBot.define do
  factory :user do
    user_name { Faker::Name.first_name }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { "abc123" }
    password_confirmation { "abc123" }
    admin { false }
  end
end
