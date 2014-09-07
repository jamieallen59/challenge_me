require 'rails_helper'

describe 'Setting your friends a challenge' do
	before do
			@mary = create(:user)
			@event = create(:event, user: @mary)
		end

	context 'challenge creator not signed in' do
		it 'displays a button to set a challenge' do
			visit event_path(@event)
			expect(page).to have_css 'a.challenge-me-button'
		end

		it 'directs them to the new challenge page' do
			visit event_path(@event)
			click_link 'Challenge Me'
			expect(page).to have_content 'What is your name?'
			expect(page).to have_content 'Describe the challange'
			expect(page).to have_content 'How much will you donate for completing this challenge?'
			expect(page).to have_button 'Create challenge'
			expect(current_path).to eq new_event_challenge_path(@event)
		end

		it 'displays the fact that they have been challenged' do
			visit event_path(@event)
			click_link 'Challenge Me'
			fill_in 'What is your name?', with: 'Joe Dowdell'
			fill_in 'Describe the challange', with: "Pour water on your head and i'll give you £5"
			fill_in 'How much will you donate for completing this challenge?', with: '5'
			click_button 'Create challenge'
			expect(current_path).to eq event_path(@event)
			expect(page).to have_content '1 challenge pending'
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
		end

		it 'displays challenge on users events page' do
			login_as @mary
			visit event_path(@event)
			expect(page).to have_content '1 challenge pending'
		end

	end
end