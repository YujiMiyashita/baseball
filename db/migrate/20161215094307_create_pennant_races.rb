class CreatePennantRaces < ActiveRecord::Migration
  def change
    create_table :pennant_races do |t|

      t.timestamps null: false
    end
  end
end
