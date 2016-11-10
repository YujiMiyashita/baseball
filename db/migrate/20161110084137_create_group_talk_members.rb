class CreateGroupTalkMembers < ActiveRecord::Migration
  def change
    create_table :group_talk_members do |t|
      t.references :user, index: true, foreign_key: true
      t.references :group_talk, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
