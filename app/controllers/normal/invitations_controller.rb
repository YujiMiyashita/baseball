class Normal::InvitationsController < NormalController
  before_action :authenticate_user!

  def create
    invitation = current_user.invitations.build(ticket_id: params[:ticket_id])
    if invitation.save
      redirect_to tickets_path
    end
  end

  def destroy
    invitation = current_user.invitations.find_by(ticket_id: params[:ticket_id])
    if invitation.destroy
      redirect_to tickets_path
    end
  end
end
