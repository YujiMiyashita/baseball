class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.datetime :playball
      t.references :user, index: true, foreign_key: true
      t.references :ballpark, index: true, foreign_key: true
      t.integer :visitor_id
      t.integer :home_id
      t.integer :number
      t.integer :price
      t.datetime :post_start_at
      t.datetime :post_end_at
      t.boolean :status, default: false
      t.boolean :format, default: false

      t.timestamps null: false
    end
  end
end
