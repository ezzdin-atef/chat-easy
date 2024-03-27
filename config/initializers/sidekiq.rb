Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/1' }
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('../sidekiq_schedule.yml', __FILE__))
    Sidekiq::Scheduler.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/1' }
end
