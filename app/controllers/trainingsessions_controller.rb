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
  	@event = Event.find(params[:event_id])

  	if @event.user.identities.find_by(provider: 'mapmyfitness').nil?
  		redirect_to '/auth/mapmyfitness'
  	else
  		@event.validate_mmf_data
  		redirect_to event_path(@event)
  	end
  end

end
