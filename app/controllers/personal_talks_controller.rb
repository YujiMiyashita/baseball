class PersonalTalksController < ApplicationController
  before_action :authenticate_user!

  def index
    @personal_talks = current_user.personal_talks
  end

  def show
    @personal_talk = current_user.personal_talks.find(params[:id])
    @messages = @personal_talk.personal_talk_messages.order(created_at: :asc)
    @message = @personal_talk.personal_talk_messages.build
  end

  def new
    @personal_talk = PersonalTalk.new
    #fields_for
  end
end
