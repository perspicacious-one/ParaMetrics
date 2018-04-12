# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

12.times do
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

2.times do
  begin
    app = RegisteredApp.create!(
      user:   users.last,
      name:  Faker::App.name,
      description:   Faker::SiliconValley.motto,
    )
  rescue Faker::UniqueGenerator::RetryLimitExceeded
    Faker::UniqueGenerator.clear
  end
end

25.times do
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

apps = RegisteredApp.all

80.times do
  begin
    event = Event.create!(
      registered_app: apps.sample,
      name: Faker::Space.planet,
    )
  rescue
  end
end

p "#{User.count} users created"
p "#{RegisteredApp.count} registered apps created"
p "#{Event.count} events created"
