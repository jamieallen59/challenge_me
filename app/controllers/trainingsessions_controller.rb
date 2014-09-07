class TrainingsessionsController < ApplicationController

	def new
		@event = Event.find(params[:event_id])
		@trainingsession = @event.trainingsessions.new
		if current_user != @event.user
			flash[:notice] = "Only the event creator can add a training session"
			redirect_to event_path(@event)
		end
	end

	def create
		@event = Event.find(params[:event_id])
		@trainingsession = @event.trainingsessions.new(params[:trainingsession].permit(:details, :sessiondate))
		if @trainingsession.save
			redirect_to event_path(@event)
		else
			render 'new'
		end
	end

  def mmf
  	#This needs fixing, I cant pass the event params through on the route
  	@event = current_user.events.first
  	@event.validate_mmf_data
  	redirect_to event_path(@event)
  end

end
