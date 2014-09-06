class PostsController < ApplicationController
	before_action :authenticate_user!

	def new
		@event = Event.find(params[:event_id])
		@post = @event.posts.new
	end

	def create
		@event = Event.find(params[:event_id])
		@post = @event.posts.new(params[:post].permit(:caption, :picture, :video))
		@post.user = current_user
		if @post.save
			redirect_to event_path(@event)
		else
			render 'new'
		end
	end

	def edit
		@event = Event.find(params[:event_id])
		@post = @event.posts.find(params[:id])
		unless @post.is_owner? current_user
			flash[:notice] = 'You are not the owner of the post'
			redirect_to '/'
		end
	end

	def update
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
		# redirect_to '/' unless @post.owner?(current_user)
		@post.update(params[:post].permit(:caption, :picture, :video))
		redirect_to event_path(@event)
	end

	def destroy
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
		if @post.is_owner? current_user
			 @post.destroy
			flash[:notice] = 'Deleted Post Successfully'
			redirect_to events_path
		else
			flash[:alert] = 'You are not the owner of the post'
			redirect_to root_path
		end



	end
end
