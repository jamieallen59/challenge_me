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
	end
end
