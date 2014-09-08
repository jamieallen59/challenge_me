require 'rails_helper'

describe 'Deleting Events' do
  before do
    @mary = create(:user)
    @fred = create(:fred)
    @event = create(:event, user: @mary)
  end

  context 'logged in as the event owner' do
    before do
      login_as @mary
      visit event_path(@event)  
    end

    it 'should have a link to delete the event' do
      expect(page).to have_css '#delete-event', text: 'Delete'
    end

    it 'should allow you to delete the event' do
      click_link 'Delete'
      expect(page).to have_content 'Deleted Successfully'
      expect(page).not_to have_content 'Bigfoot Race'
      expect(current_path).to eq events_path 
    end
  end

  context 'logged in as another user' do
    before do
      login_as @fred
      visit event_path(@event)
    end

    it 'should not have a link to edit the event' do
      expect(page).not_to have_css '#delete-event', text: 'Delete'
    end

    it 'should not allow you to delete the event' do
      page.driver.submit :delete, event_path(@event), {}
      expect(page).to have_content 'You are not the owner of the event'
      expect(current_path).to eq root_path
    end    
  end
end