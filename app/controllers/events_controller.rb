class EventsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show, :donations]

  def index
    @events = Event.all
  end

  def new
    existing_event = Event.find_by(jg_short_name: params[:page_short_name])
    redirect_to event_path(existing_event) if existing_event
    just_giving_data = JustGiving::Fundraising.new(params[:page_short_name]).page
    @event = Event.new(format_event_with(just_giving_data))
  end

  def create
    @event = Event.new(params[:event].permit(:name, :event_date, :charity, :target, :amount_raised, :training, :jg_event_id, :jg_short_name, :jg_page_id))
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

  def donations
    @event = Event.find(params[:id])
    @fundraising = JustGiving::Fundraising.new(@event.jg_short_name).page
  end

  private
  def format_event_with(api_hash)
    return if api_hash.nil? || api_hash.is_a?(Array)
    {name: api_hash['eventName'], 
    event_date: format(api_hash['eventDate']),
    charity: api_hash['charity']['name'],
    target: api_hash['fundraisingTarget'],
    amount_raised: api_hash['grandTotalRaisedExcludingGiftAid'],
    jg_event_id: api_hash['eventId'],
    jg_short_name: api_hash['pageShortName'],
    jg_page_id: api_hash['pageId'] }
  end

  def format(event_date)
    date_string = event_date.match(/\(([0-9]+)/)[1]
    Time.at(date_string.to_i / 1000).to_date
  end
end
