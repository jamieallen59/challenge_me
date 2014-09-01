require 'rails_helper'

describe 'creating pledges' do
  before do
    @mary = create(:user)
    @event = create(:event, user: @mary)
  end
  context 'as the event creator' do
    before do
      login_as @mary
    end
    it 'you can create a pledge' do
      visit event_path(@event)
      click_link 'New Pledge'
      fill_in 'Title', with: 'Herb challenge'
      fill_in 'Amount', with: '1000'
      fill_in 'Info', with: 'I promise to eat a lot of herbs'
      click_button 'Create Pledge'
      expect(current_path).to eq event_path(@event)
      expect(page).to have_content 'Once I raise £1000, I will do the Herb challenge'
      expect(page).to have_content 'I promise to eat a lot of herbs'
    end
  context 'as somebody who didnt create the event' do
    before do
      logout(:user)
    end
    it 'you cannot create a pledge' do
      visit event_path(@event)
      expect(page).not_to have_content('New Pledge')
    end
    it 'you cannot create a pledge by hacking the routes' do
      visit new_event_pledges_path(@event)

      expect(page).to have_content("Only the event creator can add a pledge")
    end
  end
end
end