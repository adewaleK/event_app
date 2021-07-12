class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]


    def index
        @events = Event.all.order("created_at DESC")
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to events_path
            flash[:alert] = "Event created successfully"
            
        else
            flash.now[:messages] = @event.errors.full_messages
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @event.update(event_params)
            redirect_to events_path
            flash[:alert] = "Event updated successfully"
        else
            render 'edit'
        end
    end

    def destroy
        if @event.destroy
          redirect_to events_path
          flash[:alert] = "Event deleted successfully"
        end
    end

    private
       def event_params
          params.require(:event).permit(:title, :description, :location, :plan, :date)
       end

       def find_event
          @event = Event.find(params[:id])
       end
end
