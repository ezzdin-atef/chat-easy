class UpdateCountsWorker
  include Sidekiq::Worker

  def perform
    update_applications_counts
    update_chats_counts
  end

  private

  def update_applications_counts
    Application.all.each do |application|
      application.update(chats_count: application.chats.count)
    end
  end

  def update_chats_counts
    Chat.all.each do |chat|
      chat.update(messages_count: chat.messages.count)
    end
  end
end

Sidekiq::Cron::Job.create(cron: '0 * * * *', class: 'UpdateCountsWorker') # execute at every 5 minutes
