class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@event = Event.find(params[:event_id])
		@post = @event.posts.new
	end

	def create
		@event = Event.find(params[:event_id])
		@post = @event.posts.new(params[:post].permit(:caption, :picture))
		@post.save
		redirect_to event_path(@event)
	end
end
