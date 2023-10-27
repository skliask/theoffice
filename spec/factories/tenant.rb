FactoryBot.define do
  factory :tenant do
    name { Faker::Company.name }
    email { 'k@sklias.me' }
    password { 'password' }
  end
end
