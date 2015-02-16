FactoryGirl.define do
  factory :story do
    title {"This is a title"}
    content {"this is a story about dionne."}
    author_id {rand(1..10)}
    parent_id {rand(1..9)}
    snippet_id {rand(1..10)}
    published {[true, false].sample}


  end
end

