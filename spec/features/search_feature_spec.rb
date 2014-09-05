require 'rails_helper'

describe 'Searching for users' do
	context 'when you type in a name to the search field on the homepage ' do
		before do
			@mary = create(:user)
			@event = create(:event, user: @mary)
		end
		it ' displays the user id' do
			visit '/'
			fill_in "search", with: "Mary"
			click_button 'Search'
			
			expect(page).to have_content 'Big'
		end
	end
end