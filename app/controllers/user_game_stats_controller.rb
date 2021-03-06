class UserGameStatsController < ApplicationController
  before_action :set_user_game_stat, only: %i[ show edit update destroy ]

  # GET /user_game_stats or /user_game_stats.json
  def index
    @user_game_stats = UserGameStat.all.sort_by{|ugs| -ugs.total_games}
  end

  # GET /user_game_stats/1 or /user_game_stats/1.json
  def show
  end

  # GET /user_game_stats/new
  def new
    @user_game_stat = UserGameStat.new
    #@user_game_stat = current_user.user_game_stat.build
  end

  # GET /user_game_stats/1/edit
  def edit
  end

  # POST /user_game_stats or /user_game_stats.json
  def create
    @user_game_stat = UserGameStat.new(user_game_stat_params)
    #@user_game_stat = current_user.user_game_stat.build(user_game_stat_params)
    respond_to do |format|
      if @user_game_stat.save
        format.html { redirect_to @user_game_stat, notice: "User game stat was successfully created." }
        format.json { render :show, status: :created, location: @user_game_stat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_game_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_game_stats/1 or /user_game_stats/1.json
  def update
    respond_to do |format|
      if @user_game_stat.update(user_game_stat_params)
        format.html { redirect_to @user_game_stat, notice: "User game stat was successfully updated." }
        format.json { render :show, status: :ok, location: @user_game_stat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_game_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_game_stats/1 or /user_game_stats/1.json
  def destroy
    @user_game_stat.destroy
    respond_to do |format|
      format.html { redirect_to user_game_stats_url, notice: "User game stat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_game_stat
      @user_game_stat = UserGameStat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_game_stat_params
      params.require(:user_game_stat).permit(:user_id, :wins, :total_games, :total_score, :highest_score)
    end
end
