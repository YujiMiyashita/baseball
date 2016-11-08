class Ballpark < ActiveRecord::Base
  has_many :profiles
  has_many :seats, dependent: :destroy
end
