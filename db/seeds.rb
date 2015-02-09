# my user info, etc.

User.create(first_name: "Clarisse", last_name: "Valera", username: "mcvalera", email: "clangvalera@gmail.com", password_hash: "clarisse", img_url: "http://goo.gl/Inoacq")

my_id = User.find_by(email: "clangvalera@gmail.com").id

my_imgs = ["http://goo.gl/FQHSKE", "http://goo.gl/e8Q2QX", "http://goo.gl/FGxs0V", "http://goo.gl/YrQHyM"]

5.times do
  Photo.create(description: "hello", user_id: my_id, url: my_imgs.sample)
end

my_photos = []
Photo.where(user_id: my_id).each do |photo|
  my_photos << photo.id
end

tags = ["beautiful", "happy", "cool", "yay", "fun", "nice"]

5.times do
  Tag.create(description: tags.sample, photo_id: my_photos.sample)
end

# random seeds

5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, email: Faker::Internet.email, password_hash: Faker::Lorem.word, img_url: "http://goo.gl/RXDpZn")
end

url = ["http://goo.gl/rvDfJk", "http://goo.gl/qJDwQg", "http://goo.gl/WahDjb",
  "http://goo.gl/SvGIOV", "http://goo.gl/lQZtM2", "http://goo.gl/hL4n9Q", "http://goo.gl/gBEYSz", "http://goo.gl/3uQGMr"]

15.times do
  Photo.create(description: Faker::Lorem.word, user_id: rand(User.all.count), url: url.sample)
end

15.times do
  Tag.create(description: tags.sample, photo_id: rand(Photo.all.count) )
end




