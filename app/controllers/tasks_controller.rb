class TasksController < ApplicationController
  before_action :set_task, applies_to: [:show, :update, :edit]
  before_action :set_event, applies_to: [:show]

  def show
  end

  def edit
  end

  def new
    @task = Task.new
  end

  def update

  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_event
      @event = @task.event
    end

end
