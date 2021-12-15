# frozen_string_literal: true

# this is project controller
class ProjectsController < ApplicationController
  before_action :load_regions, :load_spheres only: [:new, :edit]
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Projects::Creator.new(project_params, current_user).call

    if @project
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @project.destroy

    redirect_to root_path
  end

  private

  def find_project
    Project.find(params[:id])
  end

  def load_regions
    @regions = Region.all
  end

  def load_spheres
    @spheres = Sphere.all
  end

  def project_params
    params.require(:project).permit(:title, :description, region_ids: [], sphere_ids: [])
  end
end
