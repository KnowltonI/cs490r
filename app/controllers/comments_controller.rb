class CommentsController < ApplicationController
	before_action :set_event 
	#before_action :set_user
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

	def index
		@comments = @event.comments
	end

	def new
		@comment = @event.comments.new
	end

	def create
		@comment = @event.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to event_path(@event), notice: 'Comment made!'
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @comment.update_attributes(comment_params)
			redirect_to event_path(@event), notice: 'Comment updated'
		else
			render :edit
		end
	end

	def destroy
		@comment.destroy
		redirect_to event_path(@event), notice: 'Comment deleted!'
	end


private
	
	#def set_user
	#	@user = User.find(params[:user_id])
	#end

	def set_event
		@event = Event.find(params[:event_id])
	end

	def set_comment
		@comment = @event.comments.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:contents)
	end
end
