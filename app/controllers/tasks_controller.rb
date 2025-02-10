class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @tasks = Task.order(created_at: :desc)

    # Apply search filter
    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @tasks = @tasks.where("name LIKE ? OR description LIKE ?", search_query, search_query)
    end

    # Filter tasks based on status
    if params[:status].present? && params[:status] != "all"
      @tasks = @tasks.where(status: params[:status])
    end

    # Task Summary Counts
    @upcoming_tasks = Task.where(status: "open")
    @progress_tasks = Task.where(status: "inprogress")
    @pending_tasks = Task.where("deadline < ?", Date.today).where(status: ["open", "inprogress"])
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :deadline, :description, :status)
  end
end
