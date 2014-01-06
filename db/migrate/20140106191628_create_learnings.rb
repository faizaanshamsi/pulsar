class CreateLearnings < ActiveRecord::Migration
  def change
    create_table :learnings do |t|
      t.text :content, null: false
      t.string :url
    end
  end
end
