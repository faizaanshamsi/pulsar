require 'spec_helper'

describe Learning do

  describe "Database Tests" do
    it { should have_db_column(:content).of_type(:text) }
    it { should have_db_column(:url).of_type(:string) }
    it { should have_db_column(:likes_count).of_type(:integer) }
  end

  describe "Validation Tests" do
    it { should have_valid(:content).when("Blah blah") }
    it { should_not have_valid(:content).when(nil, "") }
    it { should validate_presence_of(:user) }
  end

  describe "Association Tests" do
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should belong_to(:user) }
  end

end
