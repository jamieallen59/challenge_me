require 'rails_helper'

describe 'training sessions' do

	context 'when a user has done a training session' do
		it 'should display that one of that weeks workouts has been logged' do
			@mary = create(:user)
	    @event = create(:event, user: @mary)
	    @parkrun = @event.trainingsessions.create(details: "I ran through a park")
			visit event_path(@event)
			expect(page).to have_content(" Mary has worked out 1 times this week")
		end

		# it 'should display the % total of workouts completed' do
		# 	Timecop.freeze(Time.local(2014, 8, 1, 10, 5, 0)) do
		#  	  	@mary = create(:user)
		#     	@event = create(:event, user: @mary)
		#     	@parkrun = @event.trainingsessions.create(details: "I ran through a park")
		# 	end
		# 	visit event_path(@event)
		# 	expect(page).to have_content("4% of total training sessions completed")
		# end
	end
end