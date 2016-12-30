class Vote::PennantRacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pennant_race

  def index
    @pennant_races = PennantRace.index_all
  end

  def new
    @pennant_race = PennantRace.new

  end

  def edit
  end

  def create
    @pennant_race = current_user.pennant_race.build
  end

  private

  def set_pennant_race
    @pennant_race = PennantRace.find(params[:id])
  end

  def pennant_race_params
    params.require(:pennant_race).permit(:league, :user_id, :first_team_id, :second_team_id, :third_team_id, :fourth_team_id, :fifth_team_id, :sixth_team_id)
  end
end
