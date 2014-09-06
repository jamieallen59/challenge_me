require 'rails_helper'

describe 'Creating training sessions' do

	context 'as the event creator' do 
	before(:each) do 
 	  	@mary = create(:user)
    	@event = create(:event, created_at: Date.new(2014, 9, 1), user: @mary)
    	login_as @mary
      client = double :client, :workouts => [{:name => 'Im running', :start_datetime => "2014-09-05T17:00:00+00:00"}]
      allow(Mmf::Client).to receive(:new).and_return(client)
    end

    it "let's the user fill in details about their session" do
    	visit event_path(@event)
    	click_link 'Log training session'
    	expect(page).to have_css "#new_trainingsession"
    end

    it 'gives the option to log workouts automatically from mapmyfitness' do 
      visit event_path(@event)
      click_link 'Sync'
      expect(@event.trainingsessions.count).to eq 1
      expect(@event.trainingsessions.first.details).to eq("Im running")
      expect(@event.trainingsessions.first.sessiondate.to_s).to eq("2014-09-05")
    end

  end 

  context 'not as the event creator' do 
  	before(:each) do 
			@mary = create(:user)
    	@event = create(:event, user: @mary)
  	end

  	it 'should not have a log Workout button or a sync link' do 
  		visit event_path(@event)
    	expect(page).not_to have_content 'Log training session'
      expect(page).not_to have_content 'Sync'
  	end

  	 it 'you cannot create a workout by hacking the routes' do
      visit new_event_trainingsessions_path(@event)
      expect(page).to have_content("Only the event creator can add a training session")
    end

  end

end
