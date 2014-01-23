require 'spec_helper'

feature 'user unlikes a learning', %q{
  As an authenticated user
  I want to unlike what someone has shared
  So that I can make a hasty retraction
} do

# Acceptance Criteria:

# * I have the option to ‘unlike’ a particular learning
# * Once I have ‘unliked’ a particular learning, I have the option to like it

  describe "unlikes a learning" do
    it "destroys the like" do
      user = FactoryGirl.create(:user)
      set_omniauth(user)
      visit root_path
      click_link_or_button 'Sign In'
      learning = FactoryGirl.create(:learning, user: user)
      visit learning_path(learning)
      click_on 'like'
      count = Like.count
      click_on 'unlike'

      expect(page).to have_content learning.content
      expect(page).to_not have_button 'unlike'
      expect(page).to have_button 'like'
      expect(Like.count).to eq(count - 1)
    end
  end

end
