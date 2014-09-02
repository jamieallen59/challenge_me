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
      expect(page).to have_css 'a.delete-event', text: 'Delete'
    end

    it 'should allow you to delete the event' do
      click_link 'Delete'
      
      click_on 'Update Event'
      expect(page).to have_content 'Virgin London Marathon'
      expect(current_path).to eq event_path(@event) 
    end

  end
end