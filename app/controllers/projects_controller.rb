class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
  # GET /projects
  def index
    @projects = current_user.projects
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/:id
  def show
    @project = set_project
    @user_projects = set_user_projects
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    if @project.save
      add_user_to_project
      redirect_to projects_path, notice: "Project created"
    else
      render action: 'new'
    end
  end

  # DELETE /projects/:id
  def destroy
    @project = set_project
    @project.destroy
    redirect_to projects_path
  end
  

  # PATCH/PUT /projects/:id
  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: "Project updated"
    else
      render action: 'edit'
    end
  end
  
  private
    def add_user_to_project
      UserProject.create(user_id: current_user.id, project_id: @project.id, role: :owner)  
    end

    def set_user_projects
      @project_users = UserProject.where(project_id: @project.id)
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
