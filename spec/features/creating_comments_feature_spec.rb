require 'rails_helper'

describe 'leaving comments' do
  before do
      @mary = create(:user)
      @event = create(:event, user: @mary)
      post = create(:post, event: @event, user: @mary)
      login_as @mary
    end

    it 'allows me to comment on a post' do
      visit event_path(@event)
      fill_in 'Comments', with: 'Great challenge!!'
      click_button('Submit')
      expect(page).to have_content 'Great challenge!!'
    end



end
