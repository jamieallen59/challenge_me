require 'rails_helper'

	describe 'creating posts on a profile' do
	context 'no posts' do 
		it 'displays a message when there are no posts' do 
			visit '/posts'
			expect(page).to have_content 'There are no posts'
		end
	end
end