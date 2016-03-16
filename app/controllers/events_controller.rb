class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
    
  end

  def show
    
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render action: :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render action: :edit
    end
  end

  private

    def find_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :category_id, :location_attributes => [:id, :name, :_destroy], :group_ids => [] )
    end
end
