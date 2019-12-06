# 10.times do |i|
#     User.create(name: Faker::Name.name, username: Faker::Twitter.screen_name, password: '1234', password_confirmation: '1234', bio: Faker::Quote.famous_last_words, avatar: Faker::Avatar.image)
# end

# 40.times do |i|
#     Post.create(image: Faker::LoremFlickr.image, caption: Faker::Quote.most_interesting_man_in_the_world, user_id: User.all.sample.id)
# end