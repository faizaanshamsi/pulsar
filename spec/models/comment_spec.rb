require 'spec_helper'

describe Comment do

  describe "Database Tests" do
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:learning_id).of_type(:integer) }
  end

  describe "Validation Tests" do
    it { should have_valid(:body).when("Blah blah") }
    it { should_not have_valid(:body).when(nil, "") }

    it { should validate_presence_of(:learning) }
    it { should validate_presence_of(:user) }
  end

  describe "Association Tests" do
    it { should belong_to :learning }
    it { should belong_to :user }
  end

end
