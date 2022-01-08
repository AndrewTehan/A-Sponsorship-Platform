Sidekiq::Cron::Job.create(name: 'Hard worker - every 5min', cron: '*/1 * * * *', class: 'HardWorker')
