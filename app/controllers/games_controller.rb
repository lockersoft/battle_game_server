class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, 
                                  :default, :clear_board, :add_ship,
                                  :get_board
                                 ]
  respond_to :html, :json
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

  # GET available_ships
  def available_ships
    respond_with $available_ships
  end
  
  # GET available_directions
  def available_directions
    respond_with $available_directions
  end
  
  # GET /games/new
  # GET /challenge
  # GET /api/v1/challenge_computer
  def new
    @user = current_user
    @challenged = params[:computer] ? 0 : User.find_by_id( params[:challenge] ).id

    attackboard_1 = Board.create(width:10, height:10)
    attackboard_2 = Board.create(width:10, height:10)
    defendboard_1 = Board.create(width:10, height:10)
    defendboard_2 = Board.create(width:10, height:10)
    @game = Game.new( player_id_1:@user.id, player_id_2:@challenged,
        attack_board_id_1:attackboard_1.id,
        attack_board_id_2:attackboard_2.id,
        defend_board_id_1:defendboard_1.id,
        defend_board_id_2:defendboard_2.id,
        coins: 100      # TODO:  Assign coins to different types of games.
                        # TODO:  Apportion out based on relative damage to each side
    )
    
    respond_to do |format|
      if @game.save
        # Add the ships to the computer's board if necessary
        defend_board = Board.find_by_id( @game.defend_board_id_2 )    # Computer's defending board.
        $available_ships.each do | ship_name, size |
          row = rand(0..9)    # TODO: remove hard coded range
          col = rand(0..9)
          dir = $available_directions.values.sample
          while( ! defend_board.check_ship_placement(size,row,col,dir) )
            row = rand(0..9)    # TODO: remove hard coded range
            col = rand(0..9)
            dir = $available_directions.values.sample
          end
          ship = defend_board.ships.create(name: ship_name, 
                                    size: size, 
                                    start_row: row, 
                                    start_col: col, 
                                    direction: dir )
          defend_board.position_ship(ship)
        end
        
        format.html { redirect_to game_path(@game), notice: 'Game was successfully created.' }
        format.json { render json: {"game_id" => @game.id } }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /game/:id/:board
  def get_board
    @board_type = params[:board].downcase
    if @board_type == "defend" || @board_type == "attack"
      @board = Board.find( eval( "@game." + @board_type + "_board_id_1" ))      
    end
    respond_with @board
  end
  
  # GET /games/:id/clear
  def clear_board
    @board = Board.find(@game.defend_board_id_1)
    @board.clear
    redirect_to @game
  end

  #          
  def add_ship
    # Get the user to find the right board to modify.
    if( @game.player1 == current_user)
      defend_board = Board.find_by_id( @game.defend_board_id_1 )
    else
      defend_board = Board.find_by_id( @game.defend_board_id_2 )
    end

    respond_to do |format|
      row = params[:row].downcase.ord - 'a'.ord     # Convert row letter into array number
      col = params[:col].to_i - 1
      dir = params[:direction].to_i
      ship = params[:ship].to_sym
      if( defend_board.check_ship_placement( $available_ships[ ship ],row, col, dir) )
        ship = defend_board.ships.create(name: ship,
                                  size: $available_ships[ ship ],
                                  start_row: row,
                                  start_col: col,
                                  direction: dir )
        ship.save
        defend_board.position_ship(ship)  
        
        format.html { redirect_to game_path(@game), notice: "#{ship.name} Ship Added." }
        format.json { render json: {"game_id" => @game.id, "status" => '#{ship.name} ship added' } }
      else
        format.html { redirect_to game_path(@game), notice: "Illegal Ship Placement." }
        format.json { render json: '"illegal ship placement"', status: :unprocessable_entity }
      end
    end
    
  end
  
  # GET /games/default/:id(/:placement_num)
  def default
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
      params.permit(:size, :direction, :row, :col, :board)
    end
end
