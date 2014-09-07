class ChallengesController < ApplicationController
	
	def new
		@event = Event.find(params[:event_id])
		@challenge = @event.challenges.new
	end

	def create
		@event = Event.find(params[:event_id])
		@challenge = @event.challenges.new(params[:challenge].permit(:creator, :name, :amount))
		@challenge.save
    redirect_to event_path(@event)
	end

end
