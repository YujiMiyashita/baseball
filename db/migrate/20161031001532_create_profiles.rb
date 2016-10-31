class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.string :nick_name
      t.string :back_image
      #t.references :team, index: true, foreign_key: true
      #t.references :player, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
