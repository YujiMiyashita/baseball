class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :my_ticket, only: [:edit, :update, :destroy]

  def index
    @tickets = Ticket.where(status: true)
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    if @ticket.save
      redirect_to @ticket, notice: 'チケットを登録しました'
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'チケットを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'チケットを削除しました'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def my_ticket
    redirect_to tickets_url unless @ticket.user == current_user
  end

  def ticket_params
    params.require(:ticket).permit(:playball, :ballpark_id, :visitor_id, :home_id, :number, :post_start_at, :post_end_at, :status, :format, :price)
  end
end
