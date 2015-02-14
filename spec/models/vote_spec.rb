require 'rails_helper'

describe Vote do

  let(:vote){ FactoryGirl.create(:vote) }

  it "tests if true is true" do
    expect(true).to eq true
  end

  it "should have a story_id" do
    expect(vote.story_id).to be_a Integer
  end

  it "should have a user_id" do
    expect(vote.user_id).to be_a Integer
  end

  # it "should have a boolean value for liked" do
  #   expect(vote.liked).to be true || false
  # end
end



