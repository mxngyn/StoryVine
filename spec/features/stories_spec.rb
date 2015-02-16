require 'rails_helper'

feature 'Story' do
  let(:story) {FactoryGirl.create(:story)}

  scenario "stories index" do
    expect(true).to eq true
  end

  scenario "stories index displays list of published stories" do
    visit '/stories'
    expect(page).to have_css('li')
  end

  scenario "create new story" do
    expect {
      visit '/stories/new'
      fill_in 'story_title', :with => "This is a title"
      click_button "Save"
    }.to change(Story, :count).by(1)
  end

end
