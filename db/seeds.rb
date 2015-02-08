
5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, email: Faker::Internet.email, password_hash: Faker::Lorem.word)
end

user_id = [1,2,3,4,5]

url = ["http://goo.gl/rvDfJk", "http://goo.gl/qJDwQg", "http://goo.gl/WahDjb",
  "http://goo.gl/SvGIOV", "http://goo.gl/lQZtM2", "http://goo.gl/hL4n9Q", "http://goo.gl/gBEYSz", "http://goo.gl/3uQGMr"]

10.times do
  Album.create(title: Faker::Lorem.word, description: Faker::Lorem.word, user_id: user_id.sample)
end

albums = [1,2,3,4,5,6,7,8,9,10]

15.times do
  Photo.create(description: Faker::Lorem.word, album_id: albums.sample, url: url.sample)
end

User.create(first_name: "Clarisse", last_name: "Valera", username: "mcvalera", email: "clangvalera@gmail.com", password_hash: "clarisse")

my_id = User.find_by(email: "clangvalera@gmail.com").id

Album.create(title: "Test Album", description: "moar testing", user_id: my_id)

my_album_id = Album.find_by(title: "Test Album").id

my_imgs = ["http://goo.gl/FQHSKE", "http://goo.gl/e8Q2QX", "http://goo.gl/FGxs0V", "http://goo.gl/YrQHyM"]

5.times do
  Photo.create(description: "hello", album_id: my_album_id, url: my_imgs.sample)
end