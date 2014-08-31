require 'rails_helper'

describe 'Events' do
  context 'with no events created' do 
    it 'should say no events' do 
      visit '/events'
      expect(page).to have_content("There are no events at the moment.")
    end

    it 'should allow the user to add an event' do 
      visit '/events'
      click_on 'Add Your Event'
      fill_in "Name", with: "Bigfoot Race"
      # select '2014/09/12', from: 'Event Date'
      select '2014', from: "event_event_date_1i"
      select 'September', from: "event_event_date_2i"
      select '12', from: "event_event_date_3i"
      fill_in "Charity", with: "Red Cross"
      fill_in "Fundraising Target", with: 1000
      fill_in "Amount Raised", with: 0
      click_button "Create Event"
      expect(page).to have_content "Bigfoot Race"
      expect(page).to have_content "12 September 2014"
      expect(page).to have_content "Fundraising for Red Cross"
      expect(page).to have_content "Fundraising Target: £1000"
      expect(page).to have_content "£0.0 raised so far"
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