class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]


    def index
        @events = Event.all.order("created_at DESC")
        @active_events = Event.active
        @inactive_events = Event.inactive
    end

    def new
        @event = current_user.events.build
    end

    def create
        @event = current_user.events.build(event_params)
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
