class AttendeesController < ApplicationController
  before_action :find_event

  def index
    @attendee = @event.attendees
  end

  def show
    @attendee = @event.attendees.find(params[:id])
  end

  def new
    @attendee = @event.attendees.new
  end

  def create
    @event.attendees.create!(attendee_params)
    render action: :index
  end

  def edit
    
  end

  def update
    
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def attendee_params
    params.require(:attendee).permit(:name)
  end
end
