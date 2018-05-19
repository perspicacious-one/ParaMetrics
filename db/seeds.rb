# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
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

20.times do
    begin
      name = Faker::App.unique.name
      url = ["http://", name, ".com"].join('')
      app = RegisteredApp.create!(
        user:   users.sample,
        name:  name,
        url: url.downcase,
        description:   Faker::SiliconValley.motto,
      )
      app.update_attribute(:created_at, rand(1.month .. 2.month).ago)
    rescue Faker::UniqueGenerator::RetryLimitExceeded
      Faker::UniqueGenerator.clear
    end
  end

apps = RegisteredApp.all

100.times do
  begin
    event = Event.create!(
      registered_app: apps.sample,
      name: Faker::Space.planet,
    )
    event.update_attribute(:created_at, rand(1.hour .. 1.month).ago)
  rescue
  end
end

p "#{User.count} users created"
p "#{RegisteredApp.count} registered apps created"
p "#{Event.count} events created"
