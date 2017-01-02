class Normal::PersonalTalkMembersController < NormalController
  before_action :authenticate_user!

  def create
    opponent = User.find(params[:personal_talk_member][:user_id])

    current_user.personal_talks.each do |talk|
      @start_talk = talk if talk.users.include?(opponent)
    end

    if @start_talk.nil?
      @start_talk = PersonalTalk.create
      @start_talk.personal_talk_members.create(user_id: opponent.id)
      @start_talk.personal_talk_members.create(user_id: current_user.id)
    end

    redirect_to personal_talk_path(@start_talk)
  end

  private

  def personal_talk_member_params
    params.require.(:personal_talk_member).permit(:user_id)
  end
end
