require 'rails_helper'

feature "Snippet" do
  let(:snippet) {FactoryGirl.create(:snippet)}

  scenario "View individual snippet" do
    visit snippet_path(snippet)
    expect(page).to have_content(snippet.content)
  end

  scenario "Create new snippet" do
    visit new_snippet_path

    fill_in "Content", :with => snippet.content
    click_on "Submit"

    expect(page).to have_content(snippet.content)
  end

end
