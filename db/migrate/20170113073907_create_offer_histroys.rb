class CreateOfferHistroys < ActiveRecord::Migration
  def change
    create_table :offer_histroys do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ticket, index: true, foreign_key: true
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
