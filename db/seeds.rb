# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

tenant = Tenant.create(
  name: Faker::Company.name,
  email: "me@email.me",
  password: "password1!"
)

1000.times do
  tenant.employees.create(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    role: Faker::Number.between(from: 0, to: 3)
  )
end
