# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = ActiveSupport::JSON.decode(File.read('db/seeds/users.json'))
user.each do |user_record|
  User.create!(user_record)
end

phone = ActiveSupport::JSON.decode(File.read('db/seeds/phone.json'))
phone.each do |phone_record|
  Phone.create!(phone_record)
end




