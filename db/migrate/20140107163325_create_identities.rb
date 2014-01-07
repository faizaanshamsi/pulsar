class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :user_id, null: false
      t.string :uid, null: false
      t.string :provider, null: false

      t.timestamps
    end

    add_index :identities, [:uid, :provider], unique: true
    add_index :identities, :user_id
  end
end
