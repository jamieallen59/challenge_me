require 'rails_helper'

describe 'Displaying events' do
  context 'with no events created' do 
    it 'should say no events' do 
      visit '/events'
      expect(page).to have_content("There are no events at the moment.")
    end
  end

  context 'with an event' do
    before do
      @event = create(:event)
    end

    it 'should display the event details' do
      visit '/events'
      expect(page).to have_content 'Bigfoot Race'
      expect(page).to have_content '12 September 2014'

    end
  end
end

describe 'Creating events' do
  context 'with valid data' do
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

  context 'invalid data' do
    it 'should display an error' do
      visit new_event_path
      fill_in 'Name', with: '12Big Foot'
      click_button 'Create Event'
      
      expect(page).to have_content 'error'
    end
  end
end

describe 'event page' do
  context 'with posts' do
    before do
      @event = create(:event)
      Post.create(caption: 'Test Post ABC', event_id: @event.id)
    end
    it 'should display posts' do 
      visit event_path(@event)
      expect(page).to have_content 'Test Post ABC'
    end
  end
end