env :PATH, ENV['PATH']
set :output, "#{path}/log/cron.log"

every :minute do
  rake 'cron:deactivate_projects'
end