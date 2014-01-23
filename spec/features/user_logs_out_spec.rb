require 'spec_helper'

feature 'user logs out', %q{
As a user
I can sign out
so that I can protect my privacy
} do

# Acceptance Criteria:
# I may click a logout button and receive confirmation that I am logged out
# Once I am logged out, I must log in to be able to use the site

  describe 'Authenticated user logs out' do
    it 'should log out the user' do
      user = FactoryGirl.create(:user)
      set_omniauth(user)
      visit root_path
      click_on 'Sign In'
      click_on 'Sign Out'

      expect(page).to have_content 'You have successfully logged out'
      expect(page).to_not have_button 'Sign Out'
      expect(page).to have_link 'Sign In With GitHub'
    end

    it 'should not allow logged out user to use site' do
      user = FactoryGirl.create(:user)
      set_omniauth(user)
      visit root_path
      click_on 'Sign In'
      click_on 'Sign Out'
      visit learnings_path

      current_path.should == root_path
    end

    it 'should not allow new users to any path other than root' do
      visit learnings_path

      current_path.should == root_path
    end
  end

end
