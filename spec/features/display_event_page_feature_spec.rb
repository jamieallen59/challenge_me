require 'rails_helper'

describe 'event page' do
  context 'with posts' do
    before do
      mary = create(:user)
      @event = create(:event, user: mary)
      Post.create(caption: 'Test Post ABC', event_id: @event.id, user: mary)
    end
    it 'should display posts' do
      visit event_path(@event)
      expect(page).to have_content 'Test Post ABC'
    end
  end
end

describe 'show event page' do
  before do
    mary = create(:user)
    @event = create(:event, user: mary)
 end

 it 'should query the event donations action for fundraising data' do
    fundraising = double :fundraising, page: { 'grandTotalRaisedExcludingGiftAid' => 100 }
    allow(JustGiving::Fundraising).to receive(:new).and_return(fundraising)

    visit event_path(@event)
    expect(page).to have_content '10.0 raised so far'
    expect(page).to have_content '1% of fundraising target achieved'
 end
end