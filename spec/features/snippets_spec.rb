require 'rails_helper'

feature "Snippet" do
  let(:snippet) {FactoryGirl.create(:snippet)}

  scenario "View individual snippet" do
    visit snippet_path(snippet)
    expect(page).to have_content(snippet.content)
  end

end
