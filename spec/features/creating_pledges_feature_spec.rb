require 'rails_helper'

describe 'creating pledges' do
  before do
    @mary = create(:user)
    @event = create(:event, user: @mary)
  end
  context 'as the event creator' do
    before do
      login_as @mary
      visit event_path(@event)
      click_link 'MAKE A PROMISE'
      fill_in 'Title', with: 'Herb challenge'
      fill_in 'Amount', with: '1000'
      fill_in 'Info', with: 'I promise to eat a lot of herbs'
      click_button 'Create Pledge'
    end
    it 'you can create a pledge' do
      expect(current_path).to eq event_path(@event)
      expect(page).to have_content 'Once I raise £1000, I will do the Herb challenge'
      expect(page).to have_content 'I promise to eat a lot of herbs'
    end

    it 'it will be created as a post in your post feed' do
      click_link 'MAKE A PROMISE'
      fill_in 'Title', with: 'Wetsuit challenge'
      fill_in 'Amount', with: '50'
      fill_in 'Info', with: 'Ill run in a wetsuit'
      click_button 'Create Pledge'
      visit event_path(@event)
      expect(page).to have_content 'Herb challenge'
      expect(page).to have_content 'I promise to eat a lot of herbs'
      expect(page).to have_content 'Wetsuit challenge'
      expect(page).to have_content 'Ill run in a wetsuit'
    end
  end
  context 'as somebody who didnt create the event' do
    before do
      logout(:user)
    end
    it 'you cannot create a pledge' do
      visit event_path(@event)
      expect(page).not_to have_content('MAKE A PROMISE')
    end
    it 'you cannot create a pledge by hacking the routes' do
      visit new_event_pledges_path(@event)
      expect(page).to have_content("Only the event creator can add a pledge")
    end
  end
end