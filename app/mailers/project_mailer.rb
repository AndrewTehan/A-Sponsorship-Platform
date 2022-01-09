class ProjectMailer < ApplicationMailer
  def new_project_email
    @user = params[:user]
    @project = params[:project]
    mail(to: @user.email, subject: 'There is new project!!! Hurry up to learn about new ideas!!!')
  end
end
