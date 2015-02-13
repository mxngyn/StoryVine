FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    country {Faker::Address.country}
    email {Faker::Internet.email}
    pic_url {Faker::Avatar.image}
    url {Faker::Internet.url}
    bio {Faker::Lorem.sentence}
    password "password"
  end
end
