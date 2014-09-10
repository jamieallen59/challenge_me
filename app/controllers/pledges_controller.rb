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
    @pledge = @event.pledges.new(params[:pledge].permit(:caption, :amount, :text))
    @pledge.text = "Once I raise £#{@pledge.amount}, I will do the #{@pledge.caption}. #{@pledge.text}"
    if @pledge.save!
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end
end
