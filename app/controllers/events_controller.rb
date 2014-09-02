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
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @posts = @event.posts
    @comment = Comment.new
    @pledges = @event.pledges
  end

  def edit
    @event = current_user.events.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'You are not the owner of the event'
    redirect_to root_path
  end

  def update
    @event = Event.find(params[:id])
    @event.update(params[:event].permit(:name, :event_date, :charity, :target, :amount_raised))
    redirect_to event_path(@event)
  end
end
