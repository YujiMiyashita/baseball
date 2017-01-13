class Normal::TicketsController < NormalController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_draft_ticket, only: [:draft, :draft_edit]
  before_action :except_other_ticket, only: [:draft, :edit, :draft_edit, :update, :destroy]

  def index
    @tickets = Ticket.index_all.valid
  end

  def draft_index
    @tickets = Ticket.index_all.disabled.my_ticket(current_user)
  end

  def show
    redirect_to normal_draft_ticket_path(params[:id]) if @ticket.nil?
  end

  def draft
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def draft_edit
  end

  def registration
    if params[:draft].present?
      Ticket.update(params[:id], status: 0)
      redirect_to draft_index_normal_tickets_url, notice: 'チケットを下書き一覧に登録しました'
    else
      Ticket.update(params[:id], status: 1)
      redirect_to normal_tickets_url, notice: 'チケットを本登録しました'
    end
  end

  def draft_create
    @ticket = current_user.tickets.build(ticket_params)

    if @ticket.save
      redirect_to draft_normal_ticket_url(@ticket), notice: 'チケットを下書き登録しました'
    else
      render :new
    end
  end

  def update

    if params[:commit] == '下書き保存する'
      if @ticket.update(ticket_params)
        redirect_to draft_normal_ticket_url(@ticket), notice: '下書きチケットを更新しました'
      else
        render :draft_edit
      end

    else
      if @ticket.update(ticket_params)
        redirect_to normal_ticket_path(@ticket), notice: 'チケットを更新しました'
      else
        render :edit
      end
    end
  end

  def destroy
    @ticket.destroy
    redirect_to normal_tickets_url, notice: 'チケットを削除しました'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def except_other_ticket
    redirect_to normal_tickets_url unless @ticket.user == current_user
  end

  def set_draft_ticket
    @ticket = Ticket.find_by(id: params[:id], status: 0, user_id: current_user.id)
  end

  def ticket_params
    params.require(:ticket).permit(:playball, :ballpark_id, :visitor_id, :home_id, :number, :post_start_at, :post_end_at)
  end
end
