class AddLikesCountToLearnings < ActiveRecord::Migration
  def change
    add_column :learnings, :likes_count, :integer, default: 0
  end
end
