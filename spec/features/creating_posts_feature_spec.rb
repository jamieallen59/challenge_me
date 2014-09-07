require 'rails_helper'

describe 'creating posts' do
	before do
		@mary = create(:user)
		@event = create(:event, user: @mary)
	end
	
	context 'as a logged out user' do
		it 'should redirect you to the sign in page' do
			visit event_path(@event)
			click_link 'New Post'
			expect(page).to have_content('Log in')
			expect(current_path).to eq new_user_session_path
		end
	end

	context 'as a logged in user' do
		before do
			login_as @mary
			visit event_path(@event)
			click_link 'New Post'
			fill_in 'Caption', with: '5k in 30 mins - yay!'
		end

		it 'adds a text post to a form' do
			click_button 'Create Post'
			expect(page).to have_content '5k in 30 mins - yay!'
			expect(current_path).to eq event_path(@event)
			expect(page).to have_content 'Posted by Mary Perfect'
			expect(page).not_to have_css 'img.uploaded-pic'
		end

		it 'can attach an image to a post' do
			attach_file 'Picture', Rails.root.join('app/assets/images/run.jpg')
			click_button 'Create Post'
			expect(page).to have_css 'img.uploaded-pic'
			expect(current_path).to eq event_path(@event)
		end

		it 'can attach a video link to a post' do
			fill_in 'Caption', with: 'This is me doing the cinnamon challenge'
			fill_in 'Video', with: "https://www.youtube.com/watch?v=GJ3xR_oqeEQ"
			click_button 'Create Post'
			expect(page).to have_css '.video-post'
		end

		it 'can create a text post' do
			fill_in 'Caption', with: 'September Update'
			fill_in 'Text', with: 'Hi guys, training is going really well'
			click_button 'Create Post'
			expect(page).to have_css '.text-post'
			expect(page).to have_content 'September Update'
			expect(page).to have_content 'Hi guys, training is going really well'
		end
	end

end

describe 'post validation' do
	before do
		mary = create(:user)
		@event = create(:event, user: mary)
		login_as mary
	end

	it "when info isn't valid the post isn't created " do
		visit event_path(@event)
		click_link 'New Post'
		fill_in 'Caption', with: 'yo'
		click_button 'Create Post'
		expect(page).to have_content "Your caption must be between 3 and 140 characters"
	end
end