FactoryGirl.define do
  factory :vote do
    association :story
    association :user
    liked {[true, false].sample}
  end
end
