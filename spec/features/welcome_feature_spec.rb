require 'rails_helper'

describe 'users experience' do

	it 'when visiting challenge.me index page users see homepage' do
		visit '/'
		expect(page).to have_content "WE MAKE GIVING FUN COMPLETE CHALLENGES. SMASH TARGETS"
	end

	it 'when landing on homepage expect to see search box' do
		visit '/'
		expect(page).to have_css 'input.find_person'
	end

	it "when landing on homepage expect to see LET'S GO button" do
		expect(page).to have_link("LET'S GO", href: select_events_path)
	end

	context 'when users is logged in' do
		before do
			@mary = create(:user)
			login_as @mary
		end
			it 'when visiting challenge.me users can log out' do
				visit '/'
				expect(page).to have_link(rsp'Sign Out', href: destroy_user_session)
			end
	end
end