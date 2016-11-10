class CreatePersonalTalks < ActiveRecord::Migration
  def change
    create_table :personal_talks do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
