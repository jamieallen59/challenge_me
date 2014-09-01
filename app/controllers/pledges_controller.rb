class PledgesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @pledge = @event.pledges.new
  end

  def create
    @event = Event.find(params[:event_id])
    @pledge = @event.pledges.new(params[:pledge].permit(:title, :amount, :info))
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end
end
