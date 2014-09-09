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
      before do

        #mock the JustGiving::Account API call
        account = double :account, pages: [{'eventName' => 'Hot Dog Eating Contest', 'targetAmount'=> 10000, 'raisedAmount' => 20, 'charityId' => 1},{'eventName' => 'Say Yo'}]
        allow(JustGiving::Account).to receive(:new).and_return(account)

        #mock the JustGiving::Fundraising API call
        fundraising = double :fundraising,
                      page: { 'eventName' => 'Hot Dog Eating Contest', 'eventDate' => '/Date(1412031600000+0100)/', 'charity' => { 'name' => 'Freedom for makers'}, 'fundraisingTarget' => 10000, 'grandTotalRaisedExcludingGiftAid' => 20, 'eventId' => 1, 'pageShortName' => 'hot-dawgs', 'pageId' => 1 }
        allow(JustGiving::Fundraising).to receive(:new).and_return(fundraising)
        visit '/events'
        click_on 'Add Your Event'
      end
      it 'should show the select page' do
        expect(page).to have_content 'CHOOSE EVENT'
        expect(current_path).to eq select_events_path
      end

      it 'should display the users just giving events as options ' do
        expect(page).to have_content 'HOT DOG EATING CONTEST'
        expect(page).to have_content 'SAY YO'
      end

      describe 'creating a justgiving event' do
        before do
          visit select_events_path
          click_on 'HOT DOG EATING CONTEST'
        end

        it 'selecting a just giving event should auto populate the fields' do
          expect(find_field('Name').value).to eq 'Hot Dog Eating Contest'
          expect(find('#event_target').value).to eq '10000'
          expect(find('#event_amount_raised').value).to eq '20'
          expect(find('#event_charity').value).to eq 'Freedom for makers'
        end

        it 'creating an event from the auto populated data will create the event' do
          choose "4-workouts"
          click_button "Create Event"
          expect(page).to have_content Hot Dog Eating Contest
          expect(page).to have_content "fundraising for Freedom for makers"
          expect(page).to have_content " Fundraising target: £10000"
        end
      end

      context 'invalid data' do
        it 'should display an error' do
          visit select_events_path
          click_on 'HOT DOG EATING CONTEST'
          fill_in 'Name', with: '12Big Foot'
          click_button 'Create Event'
          expect(page).to have_content 'error'
        end
      end
    end



  end
end