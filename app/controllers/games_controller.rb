class GamesController < ApplicationController
  before_action :set_game, only: %i[destroy]
  # GET /games or /games.json
  def index
    @games = Game.all
  end

  def playgame
    @game = current_user.games.build
  end

  def new
    @game = current_user.games.build
  end

  def create
    @game = current_user.games.build(game_params)
    @user_game_stat = UserGameStat.find_by(user_id: current_user.id)
    if @user_game_stat.nil?
      @user_game_stat = UserGameStat.new
      update_stats(@user_game_stat, @game.score, @game.win, true)
    else
      update_stats(@user_game_stat, @game.score, @game.win, false)
    end
    respond_to do |format|
      if @game.save && @user_game_stat.save
        format.html { redirect_to games_playgame_path, notice: "Your Game has been saved" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @user_game_stat = UserGameStat.find_by(user_id: current_user.id)
    score = @game.score
    win = @game.win
    @game.destroy 
    if Game.find_by(user_id: current_user.id).nil?
      @user_game_stat.destroy
    else 
      update_stats_on_delete(@user_game_stat, score, win)
      @user_game_stat.save
    end
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Game was deleted" }
      format.json { head :no_content }
    end
  end

  def correct_user
    @game = current_user.games.find_by(id: params[:id]) # @game id == params[:id] of row in db
    redirect_to games_path, notice: "Unauthorized action" if @game.nil?
  end
  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:score, :time_started, :win, :duration, :user_id)
    end

    def update_stats(user_game_stat, score, win = false, new_user = false)
      if new_user
        user_game_stat.user_id = current_user.id
        user_game_stat.total_games = 0
        user_game_stat.total_score = 0
        user_game_stat.wins = 0
        user_game_stat.highest_score = 0
      end
      user_game_stat.total_games += 1
      user_game_stat.total_score += score
      if user_game_stat.highest_score < score
        user_game_stat.highest_score = score
      end
      if win
        user_game_stat.wins += 1
      end
    end

    def update_stats_on_delete(user_game_stat, score, win)
      user_game_stat.total_games -= 1
      user_game_stat.total_score -= score
      if win
        user_game_stat.wins -= 1
      end
    end
end
