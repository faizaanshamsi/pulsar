require 'spec_helper'

feature "User creates a learning", %q{
  As an authenticated user
  I want to share what I learned on a given day
  So that I can share
} do

  # Acceptance Criteria:
  # * I must specify content of what I learned
  # * optionally, I may specify a URL to an external resource
  # * If I do not specify content, I am presented with an error
  # * If I specify content, the learning is recorded

  context "with valid input" do
    it "records a learning" do
      count = Learning.all.count
      user = FactoryGirl.create(:user)
      set_omniauth(user)
      visit root_path
      click_link_or_button 'Sign In'
      visit new_learning_path
      fill_in "I learned", with: "Lorem ipsum."
      fill_in "URL", with: "http://www.example.com"
      click_on "Share"

      expect(page).to have_content("Lorem ipsum.")
      expect(Learning.all.count).to eq(count + 1)
      expect(Learning.last.user).to eq(user)
    end

  end

  context "with invalid input" do
    it "throws an error" do
      count = Learning.all.count
      visit new_learning_path
      fill_in "URL", with: "screw you hippie"
      click_on "Share"

      expect(page).to have_content("Error")
      expect(Learning.all.count).to eq(count)
    end

  end

  # context "not logged in" do
  #   it "doesn't find" do
  #     expect { visit new_learning_path }.to raise_error(ActionController::RoutingError, "Not Found")
  #   end
  # end

end
