class Player < ActiveRecord::Base
  belongs_to :team
  has_many :profile

  scope :carp, -> {
    where(team_id: 1)
  }

  scope :giants, -> {
    where(team_id: 2)
  }

  scope :baystars, -> {
    where(team_id: 3)
  }

  scope :tigers, -> {
    where(team_id: 4)
  }

  scope :swallows, -> {
    where(team_id: 5)
  }

  scope :dragons, -> {
    where(team_id: 6)
  }

  scope :fighters, -> {
    where(team_id: 7)
  }

  scope :hawks, -> {
    where(team_id: 8)
  }

  scope :marines, -> {
    where(team_id: 9)
  }

  scope :eagles, -> {
    where(team_id: 10)
  }

  scope :lions, -> {
    where(team_id: 11)
  }

  scope :buffaloes, -> {
    where(team_id: 12)
  }

  enum position: { picher: 0, catcher: 1, infielder: 2, outfielder: 3 }
end
