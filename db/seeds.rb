# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(
  name: 'Lucas',
  email: 'lucas@teste.com',
  password: '123456'
)

100.times do
  Employee.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    register_number: Faker::Number.number(digits: 8),
    cpf: Faker::Number.number(digits: 11)
  )
end
