# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  uid = Faker::Lorem.characters(37)
  image_path = File.join(Rails.root, "db/seed/girl.png")
  image = File.new(image_path)
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               uid: uid,
               provider: "",
               avatar: image
               )
end

10.times do |n|
  content = Faker::HarryPotter.quote
  image_path = File.join(Rails.root, "db/seed/mahoutsukai_man.png")
  image = File.new(image_path)
  Picture.create!(content: content,
               image: image,
               user_id: n + 1
               )
end

10.times do |n|
  content = Faker::HarryPotter.book
  Comment.create!(content: content,
               user_id: n + 1,
               picture_id: n + 1
               )
end
