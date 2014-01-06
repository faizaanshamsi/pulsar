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

  scenario 'add valid comment to posting' do
    learning = FactoryGirl.create(:learning)

    visit learning_path(learning)
    fill_in 'Comment', with: 'woot!'
    click_on 'Submit Comment'

    expect(page).to have_content learning.content
    expect(page).to have_content 'woot!'
  end

  scenario 'invalid comment with no body text' do
    learning = FactoryGirl.create(:learning)

    visit learning_path(learning)
    click_on 'Submit Comment'

    expect(page).to have_content learning.content
    expect(page).to have_content 'Error'
  end

end
