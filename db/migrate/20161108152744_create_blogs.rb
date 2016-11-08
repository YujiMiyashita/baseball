class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
