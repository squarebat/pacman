class HomeController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
  	@games = Game.order(sort_column + " " + "desc")
  	@user_game_stats = UserGameStat.all.sort_by{|ugs| [-ugs.wins, -ugs.total_score, -ugs.highest_score, ugs.total_games]}
  end
  def about
  end

  private  
	def sort_column
	  Game.column_names.include?(params[:sort]) ? params[:sort] : "time_started"
	end
	
	def sort_direction
	  %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
	end
end
