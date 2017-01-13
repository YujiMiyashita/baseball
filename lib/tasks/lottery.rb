class Tasks::Lottery
  def self.ticket
    #ticket = Ticket.find_by(post_end_at: Date.yesterday)
    ticket = Ticket.first

    if ticket.present?
      offers = ticket.offer_users

      hit_offers = offers.sample(ticket.number)
      miss_offers = offers - hit_offers

      p hit_offers
      p miss_offers
    end

    puts 'そんなもんねーよ'

    hit_offers.each do |hit_offer|
      hit_offer.update(status: 1)
    end

    miss_offers.each do |miss_offer|
      miss_offer.update(status: 2)
    end

    p ticket.offer_users
  end
end
