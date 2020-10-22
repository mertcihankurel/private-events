class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to @event, notice: "Thanks for creating a new event!"
    else
      render :new
    end
  end
  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :creator_id)
  end

  def events_filter
    if params[:filter].in? %w[past upcoming]
      params[:filter]
    else
      :all
    end
  end
end
