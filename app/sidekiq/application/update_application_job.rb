class Application::UpdateApplicationJob
  include Sidekiq::Job

  def perform(name, token)
    @application = Application.find_by(token: token)
    @application.update(name: name)
    @application.save
  end
end
