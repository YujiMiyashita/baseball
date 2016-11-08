class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :name
      t.integer :price
      t.references :ballpark, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
