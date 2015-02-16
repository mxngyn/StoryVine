FactoryGirl.define do
  factory :snippet do
    association :user
    content "This is a snippet."

  end
end
