require 'rails_helper'

describe 'training sessions' do 
	context 'when a user has done a training session' do 

		before(:each) do 
 	  	@mary = create(:user)
    	@event = create(:event, user: @mary)
    	@parkrun = @event.trainingsessions.create(details: "I ran through a park")
		end
		it 'should display that one of that weeks workouts has been logged' do 
			visit event_path(@event)
			expect(page).to have_content("Mary has completed 1 out of 4 workouts planned for this week")
		end


		it 'should display the % total of workouts completed' do 
			visit event_path(@event)
			expect(page).to have_content("13% of total training sessions completed")
		end

	end

end