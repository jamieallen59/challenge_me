class PostsController < ApplicationController
	before_action :authenticate_user!

	def new
		@event = Event.find(params[:event_id])
		@post = @event.posts.new
	end

	def create
		@event = Event.find(params[:event_id])
		@post = @event.posts.new(params[:post].permit(:caption, :picture))
		@post.user = current_user
		if @post.save
			redirect_to event_path(@event)
		else
			render 'new'
		end
	end
end
