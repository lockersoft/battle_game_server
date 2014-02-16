class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :default, :clear_board]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @user = @game.player1
    @challenged = @game.player2
  end

  # GET /games/new
  def new
    @user = current_user
    @challenged = User.find_by_id( params[:challenge] )
    attackboard_1 = Board.create(width:10, height:10)
    attackboard_2 = Board.create(width:10, height:10)
    defendboard_1 = Board.create(width:10, height:10)
    defendboard_2 = Board.create(width:10, height:10)
    @game = Game.new( player_id_1:@user.id, player_id_2:@challenged.id,
        attack_board_id_1:attackboard_1.id,
        attack_board_id_2:attackboard_2.id,
        defend_board_id_1:defendboard_1.id,
        defend_board_id_2:defendboard_2.id,
        coins: 100      # TODO:  Assign coins to different types of games.
    )
    respond_to do |format|
      if @game.save
        format.html { redirect_to game_path(@game), notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /games/:id/clear
  def clear_board
    @board = Board.find(@game.defend_board_id_1)
    @board.clear
    redirect_to @game
  end

  # GET /games/default/:id(/:placement_num)
  def default
    #t.string   "name"
    #t.integer  "size"
    #t.integer  "start_row"
    #t.integer  "start_col"
    #t.integer  "direction"
    #t.string   "image"
    defend_board = Board.find_by_id( @game.defend_board_id_1 )
    #defend_board.ships.create(name:'Destroyer', size:2, start_row: 5, start_col:5, direction:0)
    #defend_board.ships.create(name:'Submarine', size:3, start_row: 2, start_col:2, direction:4)
    #
    #defend_board.ships.create(name:'Cruiser', size:3, start_row: 2, start_col:5, direction:3)
    #defend_board.ships.create(name:'Battleship', size:4, start_row: 9, start_col:5, direction:6)
    
    defend_board.ships.create(name:'Carrier', size:5, start_row: 4, start_col:4, direction:1)
    
    redirect_to game_path( @game ), notice: 'Default placement set.'
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params[:game]
    end
end
