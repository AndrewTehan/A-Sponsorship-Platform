# frozen_string_literal: true

# this is project controller
class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @industrialist = current_user
    @project = Project.new

    @project_region = ProjectsRegion.new
    @project_sphere = ProjectsSphere.new

    @regions = Region.all
    @spheres = Sphere.all
  end

  def create
    @project = Project.new(user_id: current_user.id, **project_params)

    if @project.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    @regions = Region.all
    @spheres = Sphere.all
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, region_ids: [], sphere_ids: [])
  end
end
