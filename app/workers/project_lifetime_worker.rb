class ProjectLifetimeWorker
  include Sidekiq::Worker

  def perform(*args)
    Project.all.each do |project|
      
    end
  end
end
