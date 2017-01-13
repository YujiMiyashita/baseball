class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket

  enum status: { still: 0, hit: 1, miss: 2 }
end
