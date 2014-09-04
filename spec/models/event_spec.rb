require 'rails_helper'

RSpec.describe Event, :type => :model do
  context 'Validations' do
    it 'is not valid with a name of numerical characters' do 
      event = Event.new(name: 12432)
      expect(event).to have(1).error_on(:name)
    end

    it 'is not valid unless all fields are filled in' do 
      event = Event.new(name: 'Slow Race')
      expect(event).to have(1).error_on(:event_date)
      expect(event).to have(1).error_on(:charity)
      expect(event).to have(2).error_on(:target)
      expect(event).to have(2).error_on(:amount_raised)
    end

    it 'is not valid if name is less than 3 characters' do
      event = Event.new(name: 'Sl')
      expect(event).to have(1).error_on(:name)
    end

    it 'is not valid if the target and actual amounts are not numbers' do 
      event = Event.new(target: 'abc', amount_raised: 'abc')
      expect(event).to have(1).error_on(:target)
      expect(event).to have(1).error_on(:amount_raised)
    end

    it 'is not valid if the event date is before todays date' do
      event = Event.new(event_date: Date.new(2014, 8, 1))
      expect(event).to have(1).error_on(:event_date)
    end

    it 'is not valid if no workout goal is set' do 
      event = Event.new(name: "Bigfoot Race", event_date: Date.new(2014, 9, 12), charity: "Red Cross", target: 1000, amount_raised: 10.0)
      expect(event).to have(1).error_on(:training)
    end

    xit 'is not valid if there is a duplicate just giving event for the same user' do
      user = create(:user)
      Event.create(name: "Bigfoot Race", event_date: Date.new(2014, 9, 12), charity: "Red Cross", target: 1000, amount_raised: 10.0, user_id: user.id, jg_event_id: 1)
      event = Event.create(name: "Bigfoot Race", event_date: Date.new(2014, 9, 12), charity: "Red Cross", target: 1000, amount_raised: 10.0, user_id: user.id, jg_event_id: 1)
      expect(event).to have(1).error_on(:user_id)
    end
  end

  context '#is_owner?' do
    before do
      @mary = create(:user)
      @fred = create(:fred)
      @event = create(:event, user: @mary)
    end
    it 'should return true if user is owner of the event' do 
      expect(@event.is_owner?(@mary)).to be true
    end

    it 'should return false if user is not the owner of the event' do
      expect(@event.is_owner?(@fred)).to be false
    end

    it 'should return false if nil user is passed in' do
      expect(@event.is_owner?(nil)).to be false
    end

  end
end