module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :conn_id
    def connect 
      self.conn_id = SecureRandom.uuid
    end
  end
end
