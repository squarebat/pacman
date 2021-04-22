json.extract! game, :id, :score, :time_started, :win, :duration, :created_at, :updated_at
json.url game_url(game, format: :json)
