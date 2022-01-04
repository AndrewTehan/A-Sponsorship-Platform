namespace :cron do
  task :deactivate_projects => [ :environment ] do
    Project.where(state: 'active').each do |project|
      timelife = (Time.now - project.created_at).to_i / (60 * 60 * 24)
      project.update!(state: 'closed') if timelife > 30
    end
  end
end
