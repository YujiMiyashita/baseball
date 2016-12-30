class CreatePennantRaces < ActiveRecord::Migration
  def change
    create_table :pennant_races do |t|
      t.boolean :league
      t.integer :season
      t.integer :first_team_id
      t.integer :second_team_id
      t.integer :third_team_id
      t.integer :fourth_team_id
      t.integer :fifth_team_id
      t.integer :sixth_team_id
      t.text    :content
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
