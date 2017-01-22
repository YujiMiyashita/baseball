class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :ballpark
  belongs_to :visitor, class_name: 'Team'
  belongs_to :home, class_name: 'Team'

  validates :playball,    presence: true
  validates :user_id,     presence: true
  validates :ballpark,    presence: true
  validates :visitor_id,  presence: true
  validates :home_id,     presence: true
  validates :number,      presence: true
  validates :post_end_at, presence: true
  validates :status,      presence: true

  has_many :reverse_offers, class_name: 'Offer', foreign_key: 'ticket_id', dependent: :destroy
  has_many :offer_users, through: :reverse_offers, source: :user

  scope :index_all, -> {
    select(:id, :playball, :user_id, :ballpark_id, :visitor_id, :home_id,
    :seat_id, :number, :post_end_at, :detail, :created_at, :status)
    .order(created_at: :desc)
  }

  scope :limit_bitween, -> {
    where('post_end_at >= ?', Date.tomorrow)
  }

  scope :my_ticket, -> user {
    where(user_id: user.id)
    .order(updated_at: :desc)
  }
end
