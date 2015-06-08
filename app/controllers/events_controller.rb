class EventsController < ApplicationController
  before_action :find_event, only: [ :show, :update, :destroy, :edit ]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @tasks = @event.tasks
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_url, notice: "Created #{@event.name}"
    else
      render :new
    end
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to events_path, notice: "Event updated"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url
  end

  def complete
    @event = Event.find(params[:id])
    @event.complete!
    redirect_to events_path, notice: "Event Has Been Completed!"
  end

  def completed
    @events = Event.all.completed
  end

  def incomplete
    @events = @events.incomplete
  end


  private
    def event_params
      params.require(:event).permit(:name, :start, :end, :address, :comment)
    end

    def find_event
      @event = Event.find(params[:id])
    end

end
