class PersonalTalksController < ApplicationController
  def index
    @personal_talks = current_user.personal_talks
  end

  def show
    @personal_talk = current_user.personal_talks.find(params[:id])
  end
end
