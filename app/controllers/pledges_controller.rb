class PledgesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @pledge = @event.pledges.new
    if current_user != @event.user
      flash[:notice] = "Only the event creator can add a pledge"
      redirect_to event_path(@event)
    end
  end

  def create
    @event = Event.find(params[:event_id])
    @pledge = @event.pledges.new(params[:pledge].permit(:title, :amount, :info))
    if @pledge.save
      @event.posts.create(caption: @pledge.title, text: @pledge.info, user_id: @event.user_id)
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end
end
