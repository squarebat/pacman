class PairPlayer
    def self.create(conn_id)
      if opponent = REDIS.spop("players")
        MultiplayerGame.start(conn_id, opponent)
      else
        REDIS.sadd("players", conn_id)
      end
    end
    
    def self.remove(conn_id)
      REDIS.srem("players", conn_id)
    end
  
    def self.clear_all
      REDIS.del("players")
    end
  end