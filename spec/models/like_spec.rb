require 'spec_helper'

describe Like do

  describe "Database Tests" do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:learning_id).of_type(:integer) }
    it { should have_db_index([:user_id, :learning_id]).unique(true) }
  end

  describe "Validation Tests" do
    it { should validate_numericality_of(:user_id).only_integer }
    it { should validate_numericality_of(:learning_id).only_integer }
    it 'should validate uniqueness of user learning pair' do
      Like.create!(user_id: 4, learning_id: 4)
      should validate_uniqueness_of(:user_id).scoped_to(:learning_id)
    end
  end

  describe "Association Tests" do
    it { should belong_to(:user) }
    it { should belong_to(:learning) }
  end

end
