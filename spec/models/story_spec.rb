require 'rails_helper'

describe Story do

  let(:story) { FactoryGirl.build(:story) }

  it 'has a valid factory' do
    expect(true).to eq true
  end

  it 'returns a story object' do
    expect(story).to be_kind_of(Story)
  end

  it 'has a title' do
    expect(story.title).to be_kind_of(String)
  end


end

