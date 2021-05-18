class MultiplayerGame < ApplicationRecord

    def self.start(conn_id1, conn_id2)
        ActionCable.server.broadcast "player_#{conn_id1}", {action: "game_start", msg: conn_id2}
        ActionCable.server.broadcast "player_#{conn_id2}", {action: "game_start", msg: conn_id1}

        REDIS.set("opponent_of:_#{conn_id1}", conn_id2)
        REDIS.set("opponent_of:_#{conn_id2}", conn_id1)
    end 

    def self.opponent_of(conn_id)
        REDIS.get("opponent_of:_#{conn_id}")
    end
    
    def self.make_move(conn_id, data)
        ActionCable.server.broadcast "player_#{self.opponent_of(conn_id)}", {action: "player_move", msg: data}
    end
end
