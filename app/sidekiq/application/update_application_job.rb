class Application::UpdateApplicationJob
  include Sidekiq::Job

  def perform(name)
    @application.update(name: name)
  end
end
