class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.datetime :playball #試合開始時間
      t.references :user, index: true, foreign_key: true #投稿者
      t.references :ballpark, index: true, foreign_key: true #球場
      t.integer :visitor_id #対戦相手
      t.integer :home_id #開催チーム
      t.integer :seat_id #座席
      t.integer :number #枚数
      t.datetime :post_end_at #掲載期間終了
      t.integer :status, default: 0 #ステータス（0: 未交渉, 1: 交渉中, 2: 交渉完了, 3: 交渉決裂）
      t.string :detail #備考

      t.timestamps null: false
    end
  end
end
