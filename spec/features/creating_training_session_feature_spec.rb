require 'rails_helper'

describe 'Creating training sessions' do

	context 'as the event creator' do 
	before(:each) do 
 	  	@mary = create(:user)
    	@event = create(:event, user: @mary)
    	login_as @mary
    end

    it "let's the user fill in details about their session" do
    	visit event_path(@event)
    	click_link 'Log training session'
    	expect(page).to have_css "#new_trainingsession"
    end

    it 'gives the option to log workouts automatically from mapmyfitness' do 
      visit event_path(@event)
      click_link 'Log training session'
      expect(page).to have_content('Sync your workouts from Map My Fitness')
    end

  end 

  context 'not as the event creator' do 
  	before(:each) do 
			@mary = create(:user)
    	@event = create(:event, user: @mary)
  	end

  	it 'should not have a log Workout button' do 
  		visit event_path(@event)
    	expect(page).not_to have_content 'Log training session'
  	end

  	 it 'you cannot create a workout by hacking the routes' do
      visit new_event_trainingsessions_path(@event)
      expect(page).to have_content("Only the event creator can add a training session")
    end

  end

end
