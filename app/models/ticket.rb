class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :ballpark
  belongs_to :visitor, class_name: 'Team'
  belongs_to :home, class_name: 'Team'

  scope :limit_bitween, -> current_time {
    where('post_start_at <= ?', current_time).where('post_end_at >= ?', current_time)
  }

  scope :valid, -> { where(status: true) }
  scope :disabled, -> { where(status: false) }
end
