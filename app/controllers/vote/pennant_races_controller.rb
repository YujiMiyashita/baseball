class Vote::PennantRacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pennant_race, only: [:edit]

  def index
    @central_anticipates = PennantRace.index_all.this_season(Date.today.year).central
    @pacific_anticipates = PennantRace.index_all.this_season(Date.today.year).pacific
  end

  def new
    @central_teams = Team.select(:id, :name).central
    @pacific_teams = Team.select(:id, :name).pacific
  end

  def edit
  end

  def create
    @pennant_race = current_user.pennant_races.build(pennant_race_params)
    if @pennant_race.save
      redirect_to vote_pennant_races_path
    else
      render :new
    end
  end

  private

  def set_pennant_race
    @pennant_race = PennantRace.find(params[:id])
  end

  def pennant_race_params
    params.require(:pennant_race).permit(:season, :league, :user_id, :first_team_id, :second_team_id, :third_team_id, :fourth_team_id, :fifth_team_id, :sixth_team_id)
  end
end
