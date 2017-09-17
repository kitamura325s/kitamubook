# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  uid = Faker::Lorem.characters(37)
  avatar = File.new("/home/ubuntu/workspace/kitamubook/public/uploads/picture/image/201/girl_13.png")
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               uid: uid,
               provider: "",
               avatar: avatar
               )
end

100.times do |n|
  content = Faker::HarryPotter.quote
  image = File.new("/home/ubuntu/workspace/kitamubook/public/uploads/picture/image/201/DSC_1343_xlarge.JPG")
  Picture.create!(content: content,
               image: image,
               user_id: n + 1
               )
end

100.times do |n|
  content = Faker::HarryPotter.book
  Comment.create!(content: content,
               user_id: n + 1,
               picture_id: n + 1
               )
end
