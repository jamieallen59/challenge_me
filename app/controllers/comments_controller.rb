class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:comments))
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Post created"
      redirect_to event_path(@post.event)
    else
      flash[:alert] = "Comments needs to between 3 and 140 characters"
      @event = @post.event
      @posts = @event.posts
      @pledges = @event.pledges
      @trainingsessions = @event.trainingsessions
      render 'events/show'
    end
  end
end
