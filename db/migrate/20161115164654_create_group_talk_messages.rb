class CreateGroupTalkMessages < ActiveRecord::Migration
  def change
    create_table :group_talk_messages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :group_talk, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
