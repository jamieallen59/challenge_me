require 'rails_helper'

describe 'Displaying events' do
  context 'with no events created' do
    it 'should say no events' do
      visit events_path
      expect(page).to have_content("There are no events at the moment.")
    end
  end

  context 'with an event' do
    before do
      @mary = create(:user)
      @event = create(:event, user: @mary)
    end

    it 'should display the event details' do
      visit events_path
      expect(page).to have_content 'Bigfoot Race'
      expect(page).to have_content '12 September 2014'
      expect(page).to have_content 'Mary Perfect'
    end

    it 'should display the training goal' do 
      
      visit event_path(@event)
      expect(page).to have_content 'Training Goal: 4 sessions per week'
    end
  end
end