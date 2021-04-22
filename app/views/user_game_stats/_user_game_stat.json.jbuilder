json.extract! user_game_stat, :id, :user_id, :wins, :total_games, :total_score, :highest_score, :created_at, :updated_at
json.url user_game_stat_url(user_game_stat, format: :json)
