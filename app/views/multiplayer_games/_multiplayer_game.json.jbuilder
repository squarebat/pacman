json.extract! multiplayer_game, :id, :user_id, :opponent_id, :score, :win, :time, :created_at, :updated_at
json.url multiplayer_game_url(multiplayer_game, format: :json)
