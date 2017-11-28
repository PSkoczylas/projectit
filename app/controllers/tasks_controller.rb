class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :edit, :update, :show]
  before_action :authenticate_user!
  
  # GET projects/:project_id/tasks
  def index
    @project = Project.find(params[:project_id])
    @tasks = Task.where(user_id: current_user.id, project_id: @project.id)
  end

  # GET projects/:project_id/tasks/new
  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end
  
  # GET projects/:project_id/tasks/:id/edit
  def edit
    @project = set_project
  end

  # POST projects/:project_id/tasks
  def create
    @task = Task.new(task_params)
    @task.project_id = set_project.id
    @task.user_id = current_user.id
    if @task.save
      redirect_to project_tasks_path, notice: "Task created"
    else
      render action: 'new'
    end
  end

  # GET projects/:project_id/tasks/:id
  def show
    @project = set_project
  end

  # DELETE projects/:project_id/tasks/:id
  def destroy
    @task.destroy
    redirect_to project_tasks_path
  end

  # PATCH/PUT /projects/:project_id/tasks/:id
  def update
    if @task.update(task_params)
      redirect_to project_tasks_path, notice: "Task updated"
    else
      render action: 'edit'
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :status, :priority)
    end
end
