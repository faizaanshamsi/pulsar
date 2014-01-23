require 'spec_helper'

feature "User edits their own profile", %q{
  As an authenticated user
  I want to edit my user profile
  So that I can control my identity
} do

  # Acceptance Criteria:
  # * I can change my username from my user profile page
  # * I cannot change the username of other users
  # * If I specify a valid username, the change is saved and shown across the site

  scenario "user edits own profile" do
    user = FactoryGirl.create(:user)
    learning = FactoryGirl.create(:learning, user: user)
    set_omniauth(user)
    visit root_path
    click_on 'Sign In'
    visit user_path(user)
    fill_in 'user_display_name', with: 'Ann Perkins'
    click_on 'Save'

    expect(page).to have_content('updated')
    expect(page).to have_content('Ann Perkins')
    visit learnings_path
    expect(page).to have_content('Ann Perkins')
  end

  scenario "user provides invalid information" do
    user = FactoryGirl.create(:user)
    set_omniauth(user)
    visit root_path
    click_on 'Sign In'
    visit user_path(user)
    fill_in 'user_display_name', with: ''
    click_on 'Save'

    expect(page).to_not have_content('updated')
    expect(page).to have_content('Unable')
   end

  scenario "user tries to edit someone else's profile" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, github_uid: '9876', display_name: 'bar', name: 'baz')
    set_omniauth(user1)
    visit root_path
    click_on 'Sign In'
    visit user_path(user2)

    expect(page).to_not have_field('user_display_name')
    expect(page).to_not have_button('Save')
  end

end
