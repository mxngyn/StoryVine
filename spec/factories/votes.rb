FactoryGirl.define do
  factory :vote do
    story_id {rand(1..10)}
    user_id {rand(1..20)}
    liked {[true, false].sample}
  end
end
