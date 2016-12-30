class Team < ActiveRecord::Base
  has_many :profiles
  has_many :players
  has_one :ballpark

  enum league: { central: true, pacific: false }
end
