require 'faker'

10.times do
 User.create(username: Faker::Internet.user_name, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Lorem.sentence, pic_url: Faker::Avatar.image, url: Faker::Internet.url, email: Faker::Internet.email, country: Faker::Address.country)
end

10.times do
  Snippet.create(user_id: rand(1..10), content: Faker::Lorem.sentence)
end

## STORY SEED DATA FOR VINE TESTING ##
Story.create(title: Faker::Lorem.sentence, author_id: 1, content: Faker::Lorem.paragraph, parent_id: nil, snippet_id: 1, published: true)

Story.create(title: Faker::Lorem.sentence, author_id: 1, content: Faker::Lorem.paragraph, parent_id: 1, snippet_id: 1, published: true)

Story.create(title: Faker::Lorem.sentence, author_id: 1, content: Faker::Lorem.paragraph, parent_id: 1, snippet_id: 1, published: true)

Story.create(title: Faker::Lorem.sentence, author_id: 1, content: Faker::Lorem.paragraph, parent_id: 2, snippet_id: 1, published: true)


## END ##

20.times do
  published = [true, false].sample
  Story.create(title: Faker::Lorem.sentence, author_id: rand(1..10), content: Faker::Lorem.paragraph, parent_id: rand(1..9), snippet_id: rand(1..10), published: published)
end

10.times do
  Tag.create(name: Faker::Lorem.word)
end

10.times do
  StoryTag.create(tag_id: rand(1..10), story_id: rand(1..20))
end

20.times do
  liked = [true, false].sample
  Vote.create(story_id: rand(1..20), user_id: rand(1..10), liked: liked)
end

## ADMIN ##

User.create(username: "mai", password: "password", email: "mai@mai.com", admin: true)

