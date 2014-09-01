class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:comments))
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Post created"
      redirect_to event_path(@post.event)
    else
    end
  end
end
