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
    name = Faker::Hobbit.character
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

25.times do
    begin
      title = [Faker::Hacker.unique.noun].join(' ')
      app = RegisteredApp.create!(
        user:   users.sample,
        name:  title,
        description:   Faker::SiliconValley.quote,
      )
    rescue Faker::UniqueGenerator::RetryLimitExceeded
      Faker::UniqueGenerator.clear
    end
  end

p "#{RegisterApp.count} registered apps created"
p "#{User.count} users created"
