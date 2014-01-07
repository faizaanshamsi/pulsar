class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_uuid, null: false
      t.string :name, null: false
      t.string :display_name
      t.string :github_token, null: false

      t.timestamps

      t.index :github_uuid, unique: true
    end
  end
end

