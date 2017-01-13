class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :ballpark
  belongs_to :visitor, class_name: 'Team'
  belongs_to :home, class_name: 'Team'

  scope :index_all, -> {
    select(:id, :playball, :user_id, :ballpark_id, :visitor_id, :home_id,
    :seat_id, :number, :post_end_at, :detail, :created_at, :status)
    .order(created_at: :desc)
  }

  scope :limit_bitween, -> current_time {
    where('post_start_at <= ?', current_time).
    where('post_end_at >= ?', current_time)
  }

  scope :my_ticket, -> user {
    where(user_id: user.id)
    .order(updated_at: :desc)
  }


  scope :valid, -> { where(status: 1) }
  scope :disabled, -> { where(status: 0) }
end
