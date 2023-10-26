FactoryBot.define do
  factory :employee do
    association :tenant

    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    role { Faker::Number.between(from: 0, to: 3) }
  end
end
