class CreateLearnings < ActiveRecord::Migration
  def change
    create_table :learnings do |t|
      t.text :content, null: false
      t.string :url

      t.timestamps
    end
  end
end
