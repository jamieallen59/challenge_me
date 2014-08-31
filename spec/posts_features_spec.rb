require 'rails_helper'

	describe 'creating posts on a profile' do
		context 'no posts' do 
			it 'displays a message when there are no posts' do 
				visit '/posts'
				expect(page).to have_content 'There are no posts'
			end
		end
		context 'with posts' do
			before do
				Post.create(caption: 'Really long run today!')
			end
			it ' displays posts if there any' do
				visit '/posts'
				expect(page).to have_content 'Really long run today!'
			end
		end
	end