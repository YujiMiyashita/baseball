class Tasks::Lottery
  def self.ticket
    lottery_tickets = Ticket.where(post_end_at: Date.yesterday)

    if lottery_tickets.present?
      lottery_tickets.each do |ticket|
        offers = ticket.reverse_offers

        if offers.present?
          hit_offers = offers.sample(ticket.number)
          miss_offers = offers - hit_offers

          group = GroupTalk.create(name: "#{ticket.playball.strftime("%Y/%m/%d")}観戦メンバー")
          GroupTalkMember.create(user_id: ticket.user.id, group_talk_id: group.id)

          hit_offers.each do |hit_offer|
            hit_offer.update(status: 1)
            GroupTalkMember.create(user_id: hit_offer.user.id, group_talk_id: group.id)
            Notification.create(ticket_id: ticket.id, user_id: hit_offer.user.id, content: 'チケットが当選しました！')
          end

          miss_offers.each do |miss_offer|
            miss_offer.update(status: 2)
            Notification.create(ticket_id: ticket.id, user_id: miss_offer.user.id, content: 'チケットが落選しました。。')
          end

        end

      end
    end

  end
end
