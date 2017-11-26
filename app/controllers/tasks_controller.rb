class TasksController < ApplicationController
  before_action :authenticate_user!
  
  # GET /tasks
  def index
    @tasks = Task.where(user_id: current_user.id, project_id: params[:project_id].to_i)
  end

end
