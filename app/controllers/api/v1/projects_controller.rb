class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    
    if @project.save
      render json: { message: 'create project successfully'}
    else
      render json: { message: 'create project failed' }
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      render json: { message: 'update project successfully'}
    else
      render json: { message: 'update project failed' }
    end
  end

  def destroy
    @project.deleted_at
    render json: { message: 'delete successfully' }
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
