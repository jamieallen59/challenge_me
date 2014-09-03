require 'rails_helper'

describe 'Creating events' do
  context 'as a logged out user' do
    it 'should redirect to sign in page' do
      visit '/events'
      click_on 'Add Your Event'
      expect(page).to have_content('Log in')
      expect(current_path).to eq new_user_session_path
    end
  end

  context 'as a logged in user' do
    before do
      mary = create(:user)
      login_as mary
    end

    context 'using the just giving api data' do
      it 'should show the select page' do
        visit '/events'
        click_on 'Add Your Event'
        expect(page).to have_content 'Choose an Event'
        expect(current_path).to eq select_events_path
      end
    end

    context 'with valid data' do
      it 'should allow the user to add an event' do
        visit new_event_path
        fill_in "Name", with: "Bigfoot Race"
        select '2014', from: "event_event_date_1i"
        select 'September', from: "event_event_date_2i"
        select '12', from: "event_event_date_3i"
        fill_in "Charity", with: "Red Cross"
        fill_in "Fundraising Target", with: 1000
        fill_in "Amount Raised", with: 0
        choose "4-workouts"
        click_button "Create Event"
        expect(page).to have_content "Bigfoot Race"
        expect(page).to have_content "12 September 2014"
        expect(page).to have_content "Fundraising for Red Cross"
        expect(page).to have_content "Fundraising Target: £1000"
        expect(page).to have_content "£0.0 raised so far"
        expect(page).to have_content "Training Goal: 4 sessions per week"
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
end