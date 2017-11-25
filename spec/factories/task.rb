FactoryBot.define do
  factory :task do
    project_id { create(:project).id }
    user_id { create(:user).id }
    name { Faker::Company.name }
    description { Faker::Lorem.sentence(3, false, 4) }
    status {Faker::Number.between(0, 3)}
    priority {Faker::Number.between(0, 2)}
  end
end
