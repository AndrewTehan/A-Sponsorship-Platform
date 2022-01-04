class ProjectMailer < ApplicationMailer
  def new_project_email
    User.all.each do |user|
      mail(to:user.email, subject: "Hi, #{user.nick}!!! There is new project!!! Hurry up to learn about new ideas!!!")
    end
  end
end
