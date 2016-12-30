class PennantRace < ActiveRecord::Base
  belongs_to :user

  scope :index_all, -> {
    select(:id, :league, :created_at,
           :first_team_id, :second_team_id, :third_team_id, :fourth_team_id, :fifth_team_id, :sixth_team_id)
    .order(created_at: :asc)
  }

  scope :this_season, -> current_season {
    
  }

  enum league: { central: true, pacific: false }
end
