class Team < ActiveRecord::Base
  has_many :profiles
  has_one :ballpark

  enum league: { central: true, pacific: false }
end
