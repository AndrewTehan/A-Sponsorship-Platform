module Projects
  class Creator
    include SettableEntityHelper

    def initialize(project_params, current_user)
      @project_params = project_params
      @current_user = current_user
    end

    def call
      Project.new(user: @current_user, **project_properties).tap do |project|
        project.save
        user_notification(project.id)
        project.regions << regions
        project.spheres << spheres
        project.requirements_phrases << conditions
      end
    end

    private

    def user_notification(project_id)
      NewProjectNotificatorWorker.perform_async(project_id)
    end

    attr_reader :project_params
    alias :entity_params :project_params

    def project_properties
      @project_params.slice(:title, :description)
    end
  end
end
