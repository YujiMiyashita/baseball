class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :status, default: 0
      t.integer :position, default: 0
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
