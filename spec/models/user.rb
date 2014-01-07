require 'spec_helper'

describe User do

  describe "Database Tests" do
    it { should have_db_column(:github_uuid).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:display_name).of_type(:string) }
    it { should have_db_column(:github_token).of_type(:string) }
  end

  describe "Validation Tests" do
    it { should have_valid(:github_uuid).when("Blah blah") }
    it { should_not have_valid(:github_uuid).when(nil, "") }
    it { should have_valid(:name).when("Blah blah") }
    it { should_not have_valid(:name).when(nil, "") }
    it { should have_valid(:github_token).when("Blah blah") }
    it { should_not have_valid(:github_token).when(nil, "") }
  end

  # describe "Association Tests" do
  #   it { should have_many(:learnings).dependent(:destroy) }
  # end

end
