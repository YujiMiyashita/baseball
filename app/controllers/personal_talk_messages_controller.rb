class PersonalTalkMessagesController < ApplicationController

  def create
    @message = PersonalTalkMessage.new(personal_talk_message_params)
    redirect_to personal_talk_path(@message.personal_talk) if @message.save
  end

  private

  def personal_talk_message_params
    params.require(:personal_talk_message).permit(:content, :user_id, :personal_talk_id)
  end
end
