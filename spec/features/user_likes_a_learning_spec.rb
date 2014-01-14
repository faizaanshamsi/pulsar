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
      expect(page).to have_content 'Unlike'
      expect(Like.count).to eq(count + 1)
      expect(Like.last.user).to eq(user)
      expect(Like.last.learning).to eq(learning)
    end
  end

  # describe "unlikes a learning"



  # describe "add valid comment to posting" do
  #   it "saves the comment" do
  #     count = Comment.count
  #     user = FactoryGirl.create(:user)
  #     set_omniauth(user)
  #     visit root_path
  #     click_link_or_button 'Sign In'
  #     learning = FactoryGirl.create(:learning, user: user)
  #     visit learning_path(learning)
  #     fill_in 'Comment', with: 'woot!'
  #     click_on 'Submit Comment'

  #     expect(page).to have_content learning.content
  #     expect(page).to have_content 'woot!'
  #     expect(Comment.count).to eq(count + 1)
  #     expect(Comment.last.user).to eq(user)
  #   end
  # end

  # describe "invalid comment with no body text" do
  #   it "does not save the comment" do
  #     count = Comment.count
  #     user = FactoryGirl.create(:user)
  #     set_omniauth(user)
  #     visit root_path
  #     click_link_or_button 'Sign In'
  #     learning = FactoryGirl.create(:learning, user: user)
  #     visit learning_path(learning)
  #     click_on 'Submit Comment'

  #     expect(page).to have_content learning.content
  #     expect(page).to have_content 'Error'
  #     expect(Comment.count).to eq(count)
  #   end
  # end

end
