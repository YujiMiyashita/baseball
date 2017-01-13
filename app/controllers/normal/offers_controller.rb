class Normal::OffersController < ApplicationController
  before_action :authenticate_user!

  def create
    offer = current_user.offers.build(ticket_id: params[:ticket_id])
    if offer.save
      redirect_to normal_tickets_url, notice: 'チケットを申し込みました'
    else
      redirect_to normal_tickets_url, notice: 'チケットを申し込めませんでした'
    end
  end

  def destroy
    offer = current_user.offers.find(params[:id])
    if offer.destroy
      redirect_to normal_tickets_url, notice: 'チケットの申し込みを解除しました'
    end
  end

  private

  def set_offer

  end

end
