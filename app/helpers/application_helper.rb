module ApplicationHelper
  def profile_img(profile)
    if profile.avatar?
      image_tag(profile.avatar, alt: profile.nick_name, width: 50, height: 50)
    else
      if profile.image_url.present?
        image_tag(profile.image_url, alt: profile.nick_name, width: 50, height: 50)
      else
        image_tag("noimg.jpg", width: 50, height: 50)
      end
    end
  end

  def invitation_ticket(ticket)
    invitation = Invitation.find_by(ticket_id: ticket.id, user_id: current_user.id)
    if invitation.present?
      render 'invitations/submit', ticket: ticket
    else
      render 'invitations/new', ticket: ticket
    end
  end

  def reminder_ticket(ticket)
    reminder = ticket.number - ticket.reverse_invitations.count
    if reminder == 0
      '締め切り'
    else
      "あと#{reminder}枚"
    end
  end
end
