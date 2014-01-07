class AddUserIdToLearningsAndComments < ActiveRecord::Migration
  def change
    add_column :learnings, :user_id, :integer
    add_column :comments, :user_id, :integer
  end
end
