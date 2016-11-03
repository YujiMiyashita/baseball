class TicketsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :profile_present, except: [:index]

  def index
    @tickets = Ticket.where(status: true)
  end

  def draft_index
    @tickets = Ticket.where(status: false, user_id: current_user.id)
  end

  def show
    @ticket = Ticket.find_by(id: params[:id], status: true)
    redirect_to draft_ticket_path(params[:id]) if @ticket.nil?
  end

  def draft
    @ticket = Ticket.find_by(id: params[:id], status: false, user_id: current_user.id)
  end

  def new
    @ticket = Ticket.new
  end

  def edit
    @ticket = Ticket.find(params[:id])
    redirect_to tickets_url unless @ticket.user == current_user
  end

  def registration
    @ticket = Ticket.find(params[:id])
    @ticket.status = true

    if @ticket.save
      redirect_to tickets_url, notice: 'チケットを本登録しました'
    else
      render :draft
    end
  end

  def draft_create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    @ticket.status = false

    if @ticket.save
      redirect_to draft_ticket_url(@ticket), notice: 'チケットを下書き登録しました'
    else
      render :new
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    redirect_to tickets_url unless @ticket.user == current_user
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'チケットを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    redirect_to tickets_url unless @ticket.user == current_user
    @ticket.destroy
    redirect_to tickets_url, notice: 'チケットを削除しました'
  end

  private

  def profile_present
    profile = current_user.profile
    redirect_to new_profile_path, notice: 'まずはプロフィールを登録しましょう' if profile.nil?
  end

  def ticket_params
    params.require(:ticket).permit(:playball, :ballpark_id, :visitor_id, :home_id, :number, :post_start_at, :post_end_at, :format, :price)
  end
end
