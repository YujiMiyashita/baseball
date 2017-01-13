class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ticket, index: true, foreign_key: true
      t.integer :status, default: 0 #0：未抽選, 1：当選, 2：落選

      t.timestamps null: false
    end
  end
end
