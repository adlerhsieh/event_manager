class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :dashboard, :join, :withdraw]

  def index
    if params[:search]
      @events = Event.where("name LIKE ?", "%#{params[:search]}%")
    else
      @events = Event.all
    end
    # if params[:order] == 'name'
    #   sort_by = 'name'
    # else
    #   sort_by = 'created_at'
    # end
    # @events = Event.order(sort_by)
  end

  def new
    @event = Event.new
  end

  def edit

  end

  def show

  end

  def latest
    @events = Event.order(:created_at).limit(2)
  end

  def join
    Membership.find_or_create_by(:event => @event, :user => current_user)
    redirect_to :back
  end

  def withdraw
    @membership = Membership.find_by(:event => @event, :user => current_user)
    @membership.destroy if @membership
    redirect_to :back
  end

  def bulk_delete
    Event.destroy_all
    redirect_to events_path
  end

  def dashboard
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

  def current_user
    User.first
  end
end
