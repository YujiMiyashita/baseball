class CreateBallparks < ActiveRecord::Migration
  def change
    create_table :ballparks do |t|
      t.string :name
      t.boolean :status, default: true
      t.integer :team_id, index: true

      t.timestamps null: false
    end
  end
end
