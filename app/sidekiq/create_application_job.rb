class CreateApplicationJob
  include Sidekiq::Job

  def perform(name, token)
    @application = Application.new(name: name, token: token)
    @application.save
  end
end
