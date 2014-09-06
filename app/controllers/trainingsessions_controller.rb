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
		@trainingsession = @event.trainingsessions.new(params[:trainingsession].permit(:details))
		if @trainingsession.save
			redirect_to event_path(@event)
		else
			render 'new'
		end
	end



  def mmf
  	#This needs fixing, I cant pass the event params through on the route
  	@event = current_user.events.first
  	client = Mmf::Client.new do |config|
  		config.client_key    = Rails.application.secrets.map_my_api_key
  		config.client_secret = Rails.application.secrets.map_my_api_secret
  		config.access_token  = current_user.identities.find_by(provider: 'mapmyfitness').token
		end
		client.workouts.each do |workout|
			@event.trainingsessions.create(details: workout[:name])
		end

  	redirect_to event_path(@event)
  end

end
