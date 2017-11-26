class TasksController < ApplicationController
  before_action :authenticate_user!
  
  # GET /tasks
  def index
    @tasks = Task.where(user_id: current_user.id, project_id: params[:project_id].to_i)
    @todo_tasks = @tasks.where(status: :todo)
    @in_progress_tasks = @tasks.where(status: :in_progress)
    @code_review_tasks = @tasks.where(status: :code_review)
    @done_tasks = @tasks.where(status: :done)
  end

end
