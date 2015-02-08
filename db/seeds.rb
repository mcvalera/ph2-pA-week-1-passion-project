
5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, email: Faker::Internet.email, password_hash: Faker::Lorem.word)
end

user_id = [1,2,3,4,5]

url = ["http://goo.gl/rvDfJk", "http://goo.gl/qJDwQg", "http://goo.gl/WahDjb",
  "http://goo.gl/SvGIOV", "http://goo.gl/lQZtM2", "http://goo.gl/hL4n9Q", "http://goo.gl/yJ9JJs", "http://goo.gl/gBEYSz", "http://goo.gl/3uQGMr"]

10.times do
  Album.create(title: Faker::Lorem.word, description: Faker::Lorem.word, user_id: user_id.sample)
end

albums = [1,2,3,4,5,6,7,8,9,10]

15.times do
  Photo.create(description: Faker::Lorem.word, album_id: albums.sample, url: url.sample)
end