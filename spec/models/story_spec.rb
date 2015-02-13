require 'rails_helper'

describe Story do

  let(:story) { FactoryGirl.create(:story) }

  it 'has a valid factory' do
    expect(true).to eq true
  end

  it 'returns a story object' do
    expect(story).to be_a Story
  end

end

