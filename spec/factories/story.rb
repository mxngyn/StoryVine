FactoryGirl.define do
  factory :story do
    title {"This is a title"}
    content {"this is a story about dionne."}
    association :author, factory: :user
    association :parent, factory: :story
    association :snippet
    published {[true, false].sample}


  end
end

