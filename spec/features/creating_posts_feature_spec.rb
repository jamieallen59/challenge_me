require 'rails_helper'

describe 'creating posts' do
	it 'adds the post to a form' do
		visit '/posts'
		click_link 'New Post'
		fill_in 'Caption', with: '5k in 30 mins - yay!'
		click_button 'Create Post'
		
		expect(page).to have_content '5k in 30 mins - yay!'
		expect(current_path).to eq '/posts'
	end	
end