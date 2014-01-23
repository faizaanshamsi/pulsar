require 'spec_helper'

describe User do

  describe "Database Tests" do
    it { should have_db_column(:github_uid).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:display_name).of_type(:string) }
  end

  describe "Validation Tests" do
    it { should have_valid(:github_uid).when("Blah blah") }
    it { should_not have_valid(:github_uid).when(nil, "") }

    # it { should validate_uniqueness_of(:github_uid) }

    it { should have_valid(:name).when("Blah blah") }
    it { should_not have_valid(:name).when(nil, "") }

    it { should ensure_length_of(:display_name).is_at_most(39) }

  end

  describe "Association Tests" do
    it { should have_many(:learnings).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

end
