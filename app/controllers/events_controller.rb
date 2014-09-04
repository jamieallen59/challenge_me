class EventsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @charity = JustGiving::Charity.new.get_charity(params[:data]['charityId'])
    @event = Event.new(name: params[:data]['eventName'],charity: @charity['name'], target: params[:data]['targetAmount'], amount_raised: params[:data]['raisedAmount'] )
  end

  def create
    @event = Event.new(params[:event].permit(:name, :event_date, :charity, :target, :amount_raised, :training))
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
    @trainingsession = @event.trainingsessions.new
    @trainingsessions = @event.trainingsessions
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

  def destroy
    @event = Event.find(params[:id])
    if @event.is_owner? current_user
      @event.destroy
      flash[:notice] = 'Deleted Successfully'
      redirect_to events_path
    else
      flash[:alert] = 'You are not the owner of the event'
      redirect_to root_path
    end
  end

  def select
    @events = JustGiving::Account.new(current_user.email).pages || []
  end
end
