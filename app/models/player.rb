class Player < ActiveRecord::Base
  belongs_to :team
  has_many :profile

  enum position: { picher: 0, catcher: 1, infielder: 2, outfielder: 3 }
end
