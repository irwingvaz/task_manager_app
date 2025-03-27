class TasksController < ApplicationController
    before_action :require_user
  
    def index
      @tasks = current_user.tasks.order(created_at: :desc)
    end
  
    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to tasks_path, notice: 'Task added.'
      else
        @tasks = current_user.tasks.order(created_at: :desc)
        render :index
      end
    end
  
    private
  
    def task_params
      params.require(:task).permit(:description)
    end
  
    def require_user
      redirect_to login_path, alert: 'Please log in' unless current_user
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  