require 'spec_helper'

describe Like do

  describe "Database Tests" do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:learning_id).of_type(:integer) }
    it { should have_db_index([:user_id, :learning_id]).unique(true) }
  end

  describe "Validation Tests" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:learning) }
    it 'should validate uniqueness of user learning pair' do
      user = FactoryGirl.create(:user)
      learning = FactoryGirl.create(:learning, user: user)
      FactoryGirl.create(:like, learning: learning, user: user)
      should validate_uniqueness_of(:user_id).scoped_to(:learning_id)
    end
  end

  describe "Association Tests" do
    it { should belong_to(:user) }
    it { should belong_to(:learning).counter_cache }
  end

end
