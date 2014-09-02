require 'rails_helper'

describe 'Deleting Posts' do 
	before do
    @mary = create(:user)
    @fred = create(:fred)
    @event = create(:event, user: @mary)
    @post = create(:post, event: @event, user: @mary)
  end

  context 'logged in as post owner' do 
  	before do
  		login_as @mary
  		visit event_path(@event)
    end

	  it 'should have a link to delete the post' do
	  	expect(page).to have_css 'a.delete-post', text: 'Delete Post'
	  end

	  it 'should allow you to delete the post' do 
	  	click_link 'Delete Post'
	  	expect(page).to have_content 'Deleted Post Successfully'
	  	expect(page).not_to have_content 'Run Roger'
	  	expect(current_path).to eq events_path
	  end
	end
end
