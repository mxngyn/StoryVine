require 'rails_helper'

feature 'Sign a user up' do
  let(:user) {FactoryGirl.build(:user)}

  scenario "User can sign up" do
    visit '/signup'
    expect {
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email', with: user.email
    fill_in 'user_pic_url', with: "123"
    fill_in 'user_url', with: "www.pic.com"
    fill_in 'user_bio', with: "my bio"
    click_button 'Sign Up'
    }.to change(User, :count).by(1)

  end
end

feature 'Visit a User Page' do
  let(:user) {FactoryGirl.create(:user)}

  scenario "View User Page" do
    visit user_path(user)
    expect(page).to have_content(user.username)
  end
end
