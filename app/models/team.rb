class Team < ActiveRecord::Base
  has_many :profiles
  has_many :players
end
