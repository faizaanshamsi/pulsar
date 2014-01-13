require 'spec_helper'

feature 'user comments on learning', %q{
  As an authenticated user
  I want to comment on what people have shared
  so that I can verbalize support for my colleagues' epiphanies
} do

# Acceptance Criteria:

# * For a particular learning I must specify body text for the comment
# * If I do not specify body text, an error is displayed
# * If I specify body text, the comment is saved and  viewable on the learning’s page

  describe "add valid comment to posting" do
    it "saves the comment" do
      count = Comment.count
      user = FactoryGirl.create(:user)
      set_omniauth(user)
      visit root_path
      click_link_or_button 'Sign In'
      learning = FactoryGirl.create(:learning, user: user)
      visit learning_path(learning)
      fill_in 'Comment', with: 'woot!'
      click_on 'Submit Comment'

      expect(page).to have_content learning.content
      expect(page).to have_content 'woot!'
      expect(Comment.count).to eq(count + 1)
      expect(Comment.last.user).to eq(user)
    end
  end

  describe "invalid comment with no body text" do
    it "does not save the comment" do
      count = Comment.count
      user = FactoryGirl.create(:user)
      set_omniauth(user)
      visit root_path
      click_link_or_button 'Sign In'
      learning = FactoryGirl.create(:learning, user: user)
      visit learning_path(learning)
      click_on 'Submit Comment'

      expect(page).to have_content learning.content
      expect(page).to have_content 'Error'
      expect(Comment.count).to eq(count)
    end
  end

end
