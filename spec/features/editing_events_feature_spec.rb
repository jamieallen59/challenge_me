require 'rails_helper'

describe 'Editing Events' do
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

    it 'should have a link to edit the event' do
      expect(page).to have_css 'a.edit-event', text: 'Edit'
    end
  end
end