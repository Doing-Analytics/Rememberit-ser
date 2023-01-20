class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    
    if @project.save
      redirect_to projects_path
    else
      render json: { message: create project failed }
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render json: { message: update project failed }
    end
  end

  def destroy
  end

  private
  def project_params
    params.requrie(:project).permit(:title, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
