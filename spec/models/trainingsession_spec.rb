require 'rails_helper'

RSpec.describe Trainingsession, :type => :model do
  context 'validations' do 

  	before do
      @mary = create(:user)
      @event = create(:event, created_at: Date.new(2014, 9, 1), user: @mary)
      login_as @mary
    end

  	it 'is not valid if the details part is empty' do 
  		workout = @event.trainingsessions.create
  		expect(workout).to have(1).error_on(:details)
  	end

    it 'saves the workout date if one is given' do 
      workout = @event.trainingsessions.create(details: "I swam a lot", sessiondate: Date.new(2014,9,3))
      expect(workout.sessiondate.to_s).to eq("2014-09-03") 
    end

    it 'saves todays date as the workout date if one is not given' do 
      workout = @event.trainingsessions.create(details: "I swam a lot")
      expect(workout.sessiondate.to_s).to eq(Date.today.to_s) 
    end
  end

  context 'when using mmf syncing' do
    before(:each) do 
      @mary = create(:user)
      @event = create(:event, created_at: Date.new(2014, 9, 1), user: @mary)
      login_as @mary
    end

    it 'will save workouts created after the event is created' do 
      client = double :client, :workouts => [{"name" => 'Im running', "start_datetime" => "2014-09-05T17:00:00+00:00", "_links" => {"not_route" => [{"id" => "381958558"}]}}]
      allow(Mmf::Client).to receive(:new).and_return(client)
      @event.validate_mmf_data
      expect(@event.trainingsessions.count).to eq 1
    end

    it 'will give workouts with an empty name a default name' do 
      client = double :client, :workouts => [{"name" => "", "start_datetime" => "2014-09-05T17:00:00+00:00", "_links" => {"not_route" => [{"id" => "381958558"}]}}]
      allow(Mmf::Client).to receive(:new).and_return(client)
       @event.validate_mmf_data
       expect(@event.trainingsessions.last.details).to eq "Workout on 2014-09-05"
    end

    it 'will not save workouts logged before the date the event was created' do 
      client = double :client, :workouts => [{"name" => 'Im running', "start_datetime" => "2014-07-05T17:00:00+00:00", "_links" => {"not_route" => [{"id" => "381958558"}]}}]
      allow(Mmf::Client).to receive(:new).and_return(client)
      @event.validate_mmf_data
      expect(@event.trainingsessions.count).to eq 0
    end

    it 'will not create duplicate records' do 
      client = double :client, :workouts => [{"name" => 'Im running', "start_datetime" => "2014-09-05T17:00:00+00:00", "_links" => {"not_route" => [{"id" => "381958558"}]}}, {"name" => 'Im walking', "start_datetime" => "2014-09-03T17:00:00+00:00", "_links" => {"not_route" => [{"id" => "381958558"}]}}]
      allow(Mmf::Client).to receive(:new).and_return(client)
      @event.validate_mmf_data
      @event.validate_mmf_data
      expect(@event.trainingsessions.count).to eq 2
    end

    it 'will save route data if a workout has route data' do 
      client = double :client, :workouts => [
  {"name" => 'Im running', 
   "start_datetime" => "2014-09-05T17:00:00+00:00", 
   "updated_datetime" => "2014-09-06T17:52:19+00:00", 
   "_links" => {"route" => [{"id" => "381958558"}]}}]
      allow(Mmf::Client).to receive(:new).and_return(client)
      @event.validate_mmf_data
      expect(@event.trainingsessions.first.mmf_route_id).to eq "381958558"
      expect(@event.trainingsessions.first.mmf_updated_datetime).to eq "2014-09-06T17:52:19+00:00"
    end



  end


end
