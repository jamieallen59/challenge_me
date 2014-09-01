class EventsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event].permit(:name, :event_date, :charity, :target, :amount_raised))
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @posts = @event.posts
  end
end
