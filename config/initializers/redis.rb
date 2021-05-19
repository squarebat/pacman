require "redis"
redis-host = Rails.application.cable.redis-host
redis-port = Rails.application.cable.redis-port
REDIS = Redis.new(:host => redis-host, :port => redis-port)