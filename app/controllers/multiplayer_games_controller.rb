class MultiplayerGamesController < ApplicationController
  before_action :set_multiplayer_game, only: %i[ show edit update destroy ]

  # GET /multiplayer_games or /multiplayer_games.json
  def playrace
  end 
  
  def index
    @multiplayer_games = MultiplayerGame.all
  end

  # GET /multiplayer_games/1 or /multiplayer_games/1.json
  def show
  end

  # GET /multiplayer_games/new
  def new
    @multiplayer_game = MultiplayerGame.new
  end

  # GET /multiplayer_games/1/edit
  def edit
  end

  # POST /multiplayer_games or /multiplayer_games.json
  def create
    @multiplayer_game = MultiplayerGame.new(multiplayer_game_params)

    respond_to do |format|
      if @multiplayer_game.save
        format.html { redirect_to @multiplayer_game, notice: "Multiplayer game was successfully created." }
        format.json { render :show, status: :created, location: @multiplayer_game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @multiplayer_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multiplayer_games/1 or /multiplayer_games/1.json
  def update
    respond_to do |format|
      if @multiplayer_game.update(multiplayer_game_params)
        format.html { redirect_to @multiplayer_game, notice: "Multiplayer game was successfully updated." }
        format.json { render :show, status: :ok, location: @multiplayer_game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @multiplayer_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multiplayer_games/1 or /multiplayer_games/1.json
  def destroy
    @multiplayer_game.destroy
    respond_to do |format|
      format.html { redirect_to multiplayer_games_url, notice: "Multiplayer game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multiplayer_game
      @multiplayer_game = MultiplayerGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def multiplayer_game_params
      params.require(:multiplayer_game).permit(:user_id, :opponent_id, :score, :win, :time)
    end
end
