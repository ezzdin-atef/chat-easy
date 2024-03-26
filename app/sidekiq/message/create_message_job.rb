class Message::CreateMessageJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
  end
end
