class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :from_user_id, index: true
      t.integer :to_user_id, index: true

      t.timestamps null: false
    end

    add_index :favorites, [:from_user_id, :to_user_id], unique: true
  end
end
