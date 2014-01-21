require 'spec_helper'

feature "User views user profile", %q{
  As an authenticated user
  I want to view a user profile
  So that I can know about a given user
} do

  # Acceptance Criteria:
  # * I can navigate to the profile of any valid user
  # * A user's profile contains their github name, user name and photo
  # * A user's profile also links to their Github
  # * From this profile I can view the user's most recent learnings

  scenario "user views a valid profile" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user, github_uid: '9876', display_name: 'bar', name: 'bar')
      learning = FactoryGirl.create(:learning, user: user2)
      set_omniauth(user1)
      visit root_path
      click_on 'Sign In'
      visit user_path(user2)

      expect(page).to have_content(user2.display_name)
      expect(page).to have_content(user2.name)
      expect(page).to have_content(learning.content)
    end


  scenario "user attempts to view the profile of a nonexistent user"

end
