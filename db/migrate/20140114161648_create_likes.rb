class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :learning_id, null: false

      t.timestamps
      t.index [:user_id, :learning_id], unique: true
    end
  end
end
