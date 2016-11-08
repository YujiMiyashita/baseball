class SeatsController < AdminController
  before_action :authenticate_user!
  before_action :admin_user
  before_action :set_seat, only: [:show, :edit, :update, :destory]

  def index
    @seats = Seat.all
  end

  def show
  end

  def new
    @seat = Seat.new
  end

  def edit
  end

  def create
    @seat = Seat.new(seat_params)

    if @seat.save
      redirect_to @seat, notice: '座席を登録しました'
    else
      render :new
    end
  end

  def update
    if @seat.update(seat_params)
      redirect_to @seat, notice: '座席を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @seat.destroy
    redirect_to seats_url, notice: '座席を削除しました'
  end

  private

  def set_seat
    @seat = Seat.find(params[:id])
  end

  def seat_params
    params.require(:seat).permit(:name, :ballpark_id, :price)
  end

  def admin_user
    if current_user.general?
      redirect_to root_path, notice: 'その操作はできません'
    end
  end
end
