class GroupTalkMessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = GroupTalkMessage.new(group_talk_message_params)
    redirect_to group_talk_path(@message.group_talk) if @message.save
  end

  private

  def group_talk_message_params
    params.require(:group_talk_message).permit(:content, :user_id, :group_talk_id)
  end
end
