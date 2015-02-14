require 'rails_helper'

feature 'Story' do
  let(:story) {FactoryGirl.create(:story)}

    scenario "Create a Story" do
    visit stories_path(story)
    expect(page).to have_content(story.title)
  end
end
