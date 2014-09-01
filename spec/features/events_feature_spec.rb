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
      @event = create(:event)
    end

    it 'should display the event details' do
      visit events_path
      expect(page).to have_content 'Bigfoot Race'
      expect(page).to have_content '12 September 2014'

    end
  end
end