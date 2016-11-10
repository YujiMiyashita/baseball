class CreateGroupTalks < ActiveRecord::Migration
  def change
    create_table :group_talks do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
