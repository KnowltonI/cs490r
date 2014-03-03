class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  
  def index
  	@events = Event.all
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
  		params.require(:event).permit(:name, :notes, :due_date, :due_time, :priority)
  	end

end
