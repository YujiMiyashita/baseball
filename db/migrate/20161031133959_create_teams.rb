class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :league, default: false
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
