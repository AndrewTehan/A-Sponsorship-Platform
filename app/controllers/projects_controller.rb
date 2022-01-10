class ProjectsController < ApplicationController
  before_action :load_regions, :load_spheres, :load_conditions, only: %i[new edit]
  before_action :find_project, only: %i[show edit update destroy]

  def index
    authorize Project
    projects = Projects::Filter.new(current_user).do_filter
    @projects = Kaminari.paginate_array(projects).page(params[:page]).per(5)
  end

  def show
    @requirements_phrases = RequirementsPhrase.all
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Projects::Creator.new(project_params, current_user).call
    authorize @project
    if @project
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
    if @project.update(project_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    authorize @project
    @project.destroy
    redirect_to projects_path
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def load_regions
    @regions = Region.all
  end

  def load_conditions
    @conditions = RequirementsPhrase.for_sponsor
  end

  def load_spheres
    @spheres = Sphere.all
  end

  def project_params
    params.require(:project).permit(:title, :description, requirements_phrase_ids: [], region_ids: [], sphere_ids: [])
  end
end
