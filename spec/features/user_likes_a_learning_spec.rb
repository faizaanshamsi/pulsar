require 'spec_helper'

feature 'user likes a learning', %q{
  As an authenticated user
  I want to like what someone has shared
  So that I can lazily express enthusiasm
} do

# Acceptance Criteria:

# * I have the option to ‘like’ a particular learning
# * Once I have ‘liked’ a particular learning, I have the option to unlike it
# * I may only like a learning once

  describe "likes a learning" do
    it "saves the like" do
      count = Like.count
      user = FactoryGirl.create(:user)
      set_omniauth(user)
      visit root_path
      click_link_or_button 'Sign In'
      learning = FactoryGirl.create(:learning, user: user)
      visit learning_path(learning)
      click_on 'Like'

      expect(page).to have_content learning.content
      expect(page).to_not have_button 'Like'
      expect(page).to have_button 'Unlike'
      expect(page).to have_content(count + 1)
      expect(Like.count).to eq(count + 1)
      expect(Like.last.user).to eq(user)
      expect(Like.last.learning).to eq(learning)
    end
  end

end
