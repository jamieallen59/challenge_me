require 'rails_helper'

describe 'users experience' do

	it 'when visiting challenge.me index page users see homepage' do
		visit '/'
		expect(page).to have_content 'Make giving fun.
Complete extra challenges to reach your fundraising targets'
	end

	context 'when users is logged out' do

			it 'when visiting challenge.me users can log in' do
				visit '/'
				expect(page).to have_link('Login', href: new_user_session_path)
			end

	end

end