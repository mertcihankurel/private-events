class EventsController < ApplicationController
  before_action :require_signin, except: %i[index show]

  def index
    @events = Event.send(events_filter)
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Thanks for creating a new event!'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :creator_id, :main_image, :event_date)
  end

  def events_filter
    if params[:filter].in? %w[past upcoming]
      params[:filter]
    else
      :all
    end
  end
end
