class Normal::GroupTalksController < NormalController
  before_action :authenticate_user!

  def index
    @group_talks = current_user.group_talks
  end

  def show
    if current_user.group_talks.present?
      @group_talk = current_user.group_talks.find(params[:id])
      @messages = @group_talk.group_talk_messages.order(created_at: :asc)
      @message = current_user.group_talk_messages.build(group_talk_id: @group_talk.id)
    end
  end

  def new
    @group_talk = GroupTalk.new
    @member = GroupTalkMember.new
  end

  def create
    @group_talk = GroupTalk.new(group_talk_params)
    user_ids = params[:group_talk_member][:user_id]
    if @group_talk.save && @group_talk.group_talk_members.create(user_id: current_user.id)
      user_ids.each do |user_id|
        @group_talk.group_talk_members.create(user_id: user_id) if user_id.present?
      end
    end

    redirect_to group_talks_url, notice: 'グループを作成しました！'
  end


  private

  def group_talk_params
    params.require(:group_talk).permit(:name)
  end

  def group_talk_member_params
    params.require(:group_talk_member).permit()
  end
end
