require 'rails_helper'

describe 'creating posts' do
	before do 
		@event = create(:event)
	end

	it 'adds the post to a form' do
		visit event_path(@event)
		click_link 'New Post'
		fill_in 'Caption', with: '5k in 30 mins - yay!'
		click_button 'Create Post'

		expect(page).to have_content '5k in 30 mins - yay!'
		expect(current_path).to eq event_path(@event)
	end	

	it 'can attach an image to a post' do 
		visit event_path(@event)
		click_link 'New Post'
		attach_file 'Picture', Rails.root.join('app/assets/images/run.jpg')
		click_button 'Create Post'
		expect(page).to have_css 'img.uploaded-pic'
		expect(current_path).to eq event_path(@event)
	end
end