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
			click_button 'GO'
			expect(page).to have_link 'Bigfoot race'
			expect(page).to have_content 'Red Cross'
			expect(page).to have_content 'days to go'
			expect(page).to have_content '1% complete'

		end
	end
end