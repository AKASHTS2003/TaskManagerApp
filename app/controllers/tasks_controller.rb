class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @tasks = Task.order(created_at: :desc)

    # Fetch holidays for the current month using the HolidayService
    @holidays = HolidayService.fetch_holidays

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
    @pending_tasks = Task.where("deadline < ?", Date.today).where(status: [ "open", "inprogress" ])

    respond_to do |format|
      format.html { render :index } # Ensure HTML format is handled
      format.json { render json: @tasks, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html { render :show } # Ensure HTML format is handled
      format.json { render json: @task, status: :ok }
    end
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

  # New action to provide task data in JSON format for the calendar
  def calendar_data
    tasks = Task.where("start_time IS NOT NULL AND end_time IS NOT NULL") # Ensure we have valid times
    events = tasks.map do |task|
      {
        title: task.name,
        start: task.start_time,    # Ensure your tasks have start_time and end_time attributes
        end: task.end_time,
        description: task.description,
        status: task.status
      }
    end
    render json: events
  end

  # This function determines what color the task will have in the calendar
  def get_task_color(task)
    if task.recurring
      "#FF5733"  # For recurring tasks, orange color
    elsif task.priority == "high"
      "#FF0000"  # For high-priority tasks, red color
    else
      "#00FF00"  # For regular tasks, green color
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :deadline, :description, :status, :start_time, :end_time, :user_id)
  end  
end
