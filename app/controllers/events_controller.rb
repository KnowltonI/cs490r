class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  
  def index
  	@events = Event.scoped
    @events = Event.between(params[:start], params[:end]) 
    if (params[:start] && params[:end])
      respond_to |format|
        format.html # index.html.erb
        format.json { render :json => events }
    end
  end

  def new
  	@event = Event.new
  end

  def show
  end

  def destroy
  	@event.destroy
  	redirect_to events_path, notice: 'Event Deleted'
  end

  def update
  	respond_to do |format|
  		if @event.update(event_params)
  			format.html { redirect_to @event, notice: 'Your event has been updated succesfully' }
  		else
  			format.html { render action: 'edit' }
  		end
  	end
  end

  def edit
  end

  def create
  	@event = Event.new(event_params)
  	if @event.save
  		redirect_to @event, notice: 'Your event was created'
  	else
  		render 'new'
  	end
  end

  private
  	def set_event
  		@event = Event.find(params[:id])
  	end

  	def event_params
  		params.require(:event).permit(:title, :description, :start, :end, :allDay)
  	end
end
