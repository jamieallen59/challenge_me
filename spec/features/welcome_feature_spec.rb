require 'rails_helper'

describe 'users experience' do

	it 'when visiting challenge-me index page users see homepage' do
		visit '/'
		expect(page).to have_content 'Make giving fun.
Complete extra challenged to reach your fundraising targets'
	end

end