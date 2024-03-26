class Chat::CreateChatJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
  end
end
