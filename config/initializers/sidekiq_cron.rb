Sidekiq::Cron::Job.create(name: 'Hard worker - every day', cron: '30 3 * * *', class: 'HardWorker')
