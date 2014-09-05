require 'rails_helper'

describe 'users experience' do

	it 'when visiting challenge.me index page users see homepage' do
		visit '/'
		expect(page).to have_content "WE MAKE GIVING FUN COMPLETE CHALLENGES. SMASH TARGETS. LET'S GO"
	end

	context 'when users is logged out' do

			it 'when visiting challenge.me users can log in' do
				visit '/'
				expect(page).to have_link("LET'S GO", href: select_events_path)
			end

	end

end