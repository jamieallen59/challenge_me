require 'rails_helper'

describe 'Events' do
  context 'with no events created' do 
    it 'should say no events' do 
      visit '/events'
      expect(page).to have_content("There are no events at the moment.")
    end
  end

  context 'with an event' do
    before do
      @event = Event.create(name: 'Bigfoot Race', event_date: Date.new(2014, 9, 12), charity: 'Red Cross', target: 1000, amount_raised: 10)
    end

    it 'should display the event details' do
      visit '/events'
      expect(page).to have_content 'Bigfoot Race'
      expect(page).to have_content '12 September 2014'

    end
  end
end