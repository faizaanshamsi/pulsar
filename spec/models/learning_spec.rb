require 'spec_helper'

describe Learning do

  describe "Database Tests" do
    it { should have_db_column(:content).of_type(:text) }
    it { should have_db_column(:url).of_type(:string) }
  end

  describe "Validation Tests" do
    it { should have_valid(:content).when("Blah blah") }
    it { should_not have_valid(:content).when(nil, "") }
  end

  describe "Association Tests" do
    it { should have_many(:comments).dependent(:destroy) }
  end

end
