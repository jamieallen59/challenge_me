require 'rails_helper'

describe 'Setting your friends a challenge' do

	before do
			@mary = create(:user)
			@event = create(:event, user: @mary)
		end

	context 'A friend visits your event page' do

		it 'displays a button to set a challenge' do
			visit event_path(@event)
			expect(page).to have_css '#challenge-me-link'
    end

		it 'when the button is pressed, directs them to the new challenge page' do
			visit event_path(@event)
			click_link 'Challenge Me'
			expect(page).to have_content 'What is your name?'
			expect(page).to have_content 'Describe the challange'
			expect(page).to have_content 'How much will you donate for completing this challenge?'
			expect(page).to have_button 'Create challenge'
			expect(current_path).to eq new_event_challenge_path(@event)
		end

		it 'displays the fact that the event owner has been challenged' do
			visit event_path(@event)
			click_link 'Challenge Me'
			fill_in 'What is your name?', with: 'Joe Dowdell'
			fill_in 'Describe the challange', with: "Pour water on your head and i'll give you £5"
			fill_in 'How much will you donate for completing this challenge?', with: '5'
			click_button 'Create challenge'
			expect(current_path).to eq event_path(@event)
			expect(page).to have_content "You've been challenged by Joe Dowdell! Challenge: Pour water on your head and i'll give you £5"
		end
	end

	context 'after challenge is set, and mary signs in' do
		before do
			visit event_path(@event)
			click_link 'Challenge Me'
			fill_in 'What is your name?', with: 'Joe Dowdell'
			fill_in 'Describe the challange', with: "Pour water on your head and i'll give you £5"
			fill_in 'How much will you donate for completing this challenge?', with: '5'
			click_button 'Create challenge'
			login_as @mary
			visit event_path(@event)
		end

		it 'Challenge Me link is not displayed' do
			expect(page).not_to have_link 'Challenge Me'
		end

		it 'displays challenge on her events page' do
			expect(page).to have_content "You've been challenged by Joe Dowdell! Challenge: Pour water on your head and i'll give you £5"
		end

		it 'allows the user to accept the challenge' do
			click_button '.accept-challenge'
			expect(page).to have_css '.challenge-accepted-highlighting'
		end

		it 'allows the user to decline the challenge' do
			click_button 'Decline'
			expect(page).to have_css '.challenge-declined-highlighting'
		end
	end
end