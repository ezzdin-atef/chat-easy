require 'redis'
begin
  Redis.current = Redis.new(url: ENV["REDIS_URL"] || "redis://localhost:6379/1")
rescue => e
  Rails.logger.error "Failed to connect to Redis: #{e.message}"
end
