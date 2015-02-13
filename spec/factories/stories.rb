FactoryGirl.define do
  factory :story do
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.paragraph}
    author_id {rand(1..10)}
    parent_id {rand(1..9)}
    snippet_id {rand(1..10)}
    published {[true, false].sample}


  end
end

