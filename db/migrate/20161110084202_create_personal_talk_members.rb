class CreatePersonalTalkMembers < ActiveRecord::Migration
  def change
    create_table :personal_talk_members do |t|
      t.references :user, index: true, foreign_key: true
      t.references :personal_talk, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
