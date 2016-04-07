class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :dashboard, :join, :withdraw, :destroy]

      def index
         @page   = params[:page] ||= "1"
         @events = Event.includes(:groups, :location, :category).all
         @events.search(params[:search]) if params[:search]
         @events = @events.page(params[:page]).per(5)

         respond_to do |format|
           format.html
           format.js
         end
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
          redirect_to events_path, warning: 'warning!'
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

      def destroy
        @event.destroy
        flash[:notice] = "No. #{@event.id} is destroyed."
        redirect_to events_path(page: params[:page])
      end

      private

      def find_event
        @event = Event.find(params[:id])
      end

      def event_params
        params.require(:event).permit(:name, :description, :category_id, :location_attributes => [:id, :name, :_destroy], :group_ids => [] )
      end
end
