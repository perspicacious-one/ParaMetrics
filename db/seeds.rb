# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

15.times do
  begin
    name = Faker::SiliconValley.unique.character
    User.create!(
    name:     name,
    email:    Faker::Internet.unique.free_email(name.split(' ').join('-')),
    password: Faker::Internet.password
    )
  rescue Faker::UniqueGenerator::RetryLimitExceeded
    Faker::UniqueGenerator.clear
  end
end

User.create!(
  name: "Nelson",
  email: "nelsondcraig@gmail.com",
  password: "password"
)

users = User.all

40.times do
    begin
      app = RegisteredApp.create!(
        user:   users.sample,
        name:  Faker::App.name,
        description:   Faker::SiliconValley.motto,
      )
    rescue Faker::UniqueGenerator::RetryLimitExceeded
      Faker::UniqueGenerator.clear
    end
  end

p "#{RegisteredApp.count} registered apps created"
p "#{User.count} users created"
