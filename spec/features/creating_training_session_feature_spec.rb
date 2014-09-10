require 'rails_helper'

describe 'Creating training sessions' do

	context 'as the event creator' do
	before(:each) do
 	  	@mary = create(:user)
    	@event = create(:event, created_at: Date.new(2014, 9, 1), user: @mary)
    	login_as @mary
    	visit event_path(@event)
    end

    it "let's the user fill in details about their session" do
      click_link 'MENU'
      find('#log-workout').click
    	expect(page).to have_content "Training details"
    end

  end

  context 'with an mmf account previously logged in' do

    before(:each) do
      @mary = create(:user)
      login_as @mary
      @event = create(:event, created_at: Date.new(2014, 9, 1), user: @mary)
      client = double :client, :workouts => [{"name" => 'Im running', "start_datetime" => "2014-09-05T17:00:00+00:00", "_links" => {"not_route" => [{"id" => "381958558"}]}}]
      allow(Mmf::Client).to receive(:new).and_return(client)
      visit event_path(@event)
    end

    it 'gives the option to log workouts automatically from mapmyfitness' do
      find('#sync-mmf').click
      @event.validate_mmf_data
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

  	it 'should not have a MENU link to log Workout button or a sync link' do
  		visit event_path(@event)
    	expect(page).not_to have_css '#log-workout'
  	end

  	 it 'you cannot create a workout by hacking the routes' do
      visit new_event_trainingsessions_path(@event)
      expect(page).to have_content("Only the event creator can add a training session")
    end

  end

end
