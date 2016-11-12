class CreatePersonalTalkMessages < ActiveRecord::Migration
  def change
    create_table :personal_talk_messages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :personal_talk, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
