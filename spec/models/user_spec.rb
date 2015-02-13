require 'rails_helper'
require 'factory_girl_rails'

describe User do
  let(:user){ FactoryGirl.create(:user) }

  it "has a valid FACTORY" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "should have an email address" do
    #when left blank, this tests for truthiness
    expect(user.email).to be
  end

  it "should have a valid email address" do
    expect(user.email).to match(/^\w+.\w+@\w+.\w+$/)
  end

  it 'should be able to create snippets' do
    expect(user.snippets).to be
  end

  it 'should be able to create stories' do
    expect(user.stories).to be
  end

  it 'should be able to vote' do
    expect(user.votes).to be
  end

end
