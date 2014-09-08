require 'rails_helper'

describe 'show event page' do
  before do
   @mary = create(:user)
   @event = create(:event, user: @mary)
  end
  context 'with posts' do
    it 'should display posts' do
      Post.create(caption: 'Test Post ABC', event_id: @event.id, user: @mary)
      visit event_path(@event)
      expect(page).to have_content 'Test Post ABC'
    end
  end

  it 'should query the event donations action for fundraising data' do
    fundraising = double :fundraising, page: { 'grandTotalRaisedExcludingGiftAid' => 100 }
    allow(JustGiving::Fundraising).to receive(:new).and_return(fundraising)

    visit event_path(@event)
    expect(page).to have_content 'Raised so far: £10.0'
    expect(page).to have_content 'Percentage complete: 1%'
  end

 context 'creators can access their other events from profile page' do
  before do
    login_as @mary
  end
  it 'by clicking my events button' do
    visit event_path(@event)
    click_link 'My Events'
    expect(current_path).to eq select_events_path
  end

 end
end