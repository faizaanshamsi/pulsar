class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :learning_id, null: false

      t.timestamps
    end
  end
end
