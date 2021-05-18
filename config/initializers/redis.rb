require "redis"
#host = Rails.application.cable.redis-host
#port = Rails.application.cable.redis-port
REDIS = Redis.new(:host => "127.0.0.1", :port => "6379")