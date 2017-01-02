class Admin::PlayersController < AdminController
  before_action :authenticate_administrator!
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
  end

  def carp
    @players = Player.carp
  end

  def giants
    @players = Player.giants
  end

  def baystars
    @players = Player.baystars
  end

  def tigers
    @players = Player.tigers
  end

  def swallows
    @players = Player.swallows
  end

  def dragons
    @players = Player.dragons
  end

  def fighters
    @players = Player.fighters
  end

  def hawks
    @players = Player.hawks
  end

  def marines
    @players = Player.marines
  end

  def eagles
    @players = Player.eagles
  end

  def lions
    @players = Player.lions
  end

  def buffaloes
    @players = Player.buffaloes
  end

  def show
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to admin_player_path(@player), notice: '選手を登録しました'
    else
      render :new
    end
  end

  def update
    if @player.update
      redirect_to admin_player_path(@player), notice: '選手を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to admin_players_path, notice: '選手を抹消しました'
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :position, :team_id)
  end
end
