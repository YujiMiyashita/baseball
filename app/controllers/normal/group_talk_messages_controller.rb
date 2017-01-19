class Normal::GroupTalkMessagesController < NormalController
  before_action :authenticate_user!

  def create
    @message = current_user.group_talk_messages.build(group_talk_message_params)
    redirect_to normal_group_talk_path(@message.group_talk) if @message.save
  end

  private

  def group_talk_message_params
    params.require(:group_talk_message).permit(:content, :group_talk_id)
  end
end
