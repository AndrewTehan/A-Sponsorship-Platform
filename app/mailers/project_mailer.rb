class ProjectMailer < ApplicationMailer
default from: ENV['email_user_name']

  def new_project_email
    User.find_each do |user|
      mail(to:user.email, subject: "Hi, #{user.nick}!!! There is new project!!! Hurry up to learn about new ideas!!!")
    end
  end
end
