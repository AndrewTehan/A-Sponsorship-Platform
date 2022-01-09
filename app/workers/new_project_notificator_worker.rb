class NewProjectNotificatorWorker
  include Sidekiq::Worker

  def perform(project_id)
    project = Project.find(project_id)
    User.sponsors.each do |sponsor|
      ProjectMailer.with(user: sponsor, project: project).new_project_email.deliver_later
    end
  end
end
