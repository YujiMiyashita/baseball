class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.string :image_url
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.string :nick_name
      t.string :back_image
      t.integer :team_id, index: true
      t.integer :player_id, index: true
      t.integer :ballpark_id, index: true

      t.timestamps null: false
    end
  end
end
