require 'rails_helper'

describe 'Editing Posts' do 
	before do
    @mary = create(:user)
    @fred = create(:fred)
    @event = create(:event, user: @mary)
    @post = create(:post, event: @event, user: @mary)
  end

  context 'logged in as the post owner' do 
  	before do 
  		login_as @mary
      visit event_path(@event)
  	end

  	it 'should have a link to edit the post' do
      expect(page).to have_css 'a.edit-post', text: 'Edit Post'
    end

    it 'should allow you to edit the post' do
      click_link 'Edit Post'
      fill_in 'Caption', with: 'Ka-boom!'
      click_on 'Update Post'
      expect(page).to have_content 'Ka-boom!'
      expect(current_path).to eq event_path(@event) 
    end

  end
end
