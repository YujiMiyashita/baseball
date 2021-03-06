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

  def ticket_status(ticket)
    if ticket.user == current_user
      'My Ticket'
    else
      if Date.today < ticket.post_end_at
        if current_user.offers.find_by(ticket_id: ticket.id).present?
          button_to '申し込み', normal_ticket_offer_path(ticket_id: ticket.id, id: current_user.offers.find_by(ticket_id: ticket.id)), method: :delete, class: 'btn btn-danger'
        else
          button_to '申し込み', normal_ticket_offers_path(ticket_id: ticket.id), class: 'btn btn-success'
        end
      else
        '申し込み終了'
      end
    end
  end

  def lottery_ticket(ticket, offers)
    hit_offer = offers.sample(ticket.number)
    miss_offer = offers - hit_offer

    hit_offer.each do |offer|
      offer.update(status: 1)
    end

    miss_offer.each do |offer|
      offer.update(status: 2)
    end
  end
end
