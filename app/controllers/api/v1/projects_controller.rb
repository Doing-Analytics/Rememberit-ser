class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update, :destroy]
  def index
    @projects = current_user.projects.all
    render json: { message: "#{@projects.first.title}" }
  end

  def create
    authorize @project, policy_class: ProjectPolicy
    @project = current_user.projects.create(project_params)
    
    if @project
      render json: { message: 'create project successfully'}
    else
      render json: { message: "#{@project.errors.full_messages}" }
    end
  end

  def update
    authorize @project, policy_class: ProjectPolicy
    if @project.update(project_params)
      render json: { message: 'update project successfully'}
    else
      render json: { message: 'update project failed' }
    end
  end

  def destroy
    authorize @project, policy_class: ProjectPolicy
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
