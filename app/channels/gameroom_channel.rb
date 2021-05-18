class GameroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "player_#{conn_id}" 
    PairPlayer.create(conn_id)
  end

  def receive(data)
  end

  def send_move(data)
    RaceGame.make_move(conn_id, data)
  end

  def unsubscribed
    PairPlayer.remove(conn_id)
    RaceGame.forfeit(conn_id)
  end 
end
