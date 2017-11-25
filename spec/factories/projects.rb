FactoryBot.define do
  factory :project do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence(3, false, 4) }
  end
end
