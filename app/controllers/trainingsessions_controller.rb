class TrainingsessionsController < ApplicationController

	def new
		@event = Event.find(params[:event_id])
		@trainingsession = @event.trainingsessions.new
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
end
