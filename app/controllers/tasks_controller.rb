class TasksController < ApplicationController
  before_action :find_event
  before_action :find_task, except: [:new, :index, :create]

  def show; end

  def edit; end

  def new
    @task = Task.new
    @task.build_contact
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to event_task_path(@event, @task), notice: "Task Updated"
    else
      render :edit
    end
  end

  def create
    @task = Task.new(task_params)
    @task.event = @event
    if @task.save
      redirect_to event_task_path(@event, @task) # redirect to tasks#show
    else
      render :new
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.event = @event
    @task.complete! #calling for the def in task.rb in models
    redirect_to event_path(@event), notice: 'Task Completed!'
  end

  def incomplete
    @tasks = @tasks.incomplete
  end

  def completed
    @tasks = @tasks.completed
  end

  def upcoming
    @tasks = @tasks.upcoming
  end

  def overdue
    @tasks = @tasks.incomplete.overdue
  end

  # def update_contact
  #   @task = Task.find(params[:id])
  #   @contact = @task.contact
  # end

  def destroy
    @task.destroy
    redirect_to event_path(@event)
  end

  private

  def find_event
    @event = Event.find(params[:event_id]) # find a specific event
  end

  def find_task
    @task = @event.tasks.find(params[:id]) #find a specific task
  end

  def task_params
    params.require(:task).permit(:name, :deadline, :cost, :comment, contact_attributes: [ :name, :company, :phone1, :phone2, :email, :address, :comment ])
  end



end
