class CreateBallparks < ActiveRecord::Migration
  def change
    create_table :ballparks do |t|
      t.string :name
      t.boolean :effective, default: true

      t.timestamps null: false
    end
  end
end
