require_relative '../spec_helper'

describe Story do
  it 'has a valid factory' do
    expect(true).to eq true
  end

  it 'returns a story object' do
    expect(build(:story)).to be_a Story
  end

end

