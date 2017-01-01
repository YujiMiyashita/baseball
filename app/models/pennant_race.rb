class PennantRace < ActiveRecord::Base
  belongs_to :user

  belongs_to :first_team,  class_name: 'Team'
  belongs_to :second_team, class_name: 'Team'
  belongs_to :third_team,  class_name: 'Team'
  belongs_to :fourth_team, class_name: 'Team'
  belongs_to :fifth_team,  class_name: 'Team'
  belongs_to :sixth_team,  class_name: 'Team'

  scope :index_all, -> {
    select(:id, :league, :created_at, :user_id,
           :first_team_id, :second_team_id, :third_team_id, :fourth_team_id, :fifth_team_id, :sixth_team_id)
    .order(created_at: :asc)
  }

  scope :this_season, -> current_season {
    where(season: current_season)
  }

  enum league: { central: true, pacific: false }
end
