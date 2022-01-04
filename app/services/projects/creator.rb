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
        project.regions << regions
        project.spheres << spheres
        project.requirements_phrases << conditions
      end
    end

    private

    attr_reader :project_params
    alias :entity_params :project_params

    def project_properties
      @project_params.slice(:title, :description)
    end
  end
end
