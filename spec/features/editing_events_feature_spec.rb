require 'rails_helper'

describe 'Editing Events' do
  before do
    @mary = create(:user)
    @fred = create(:fred)
    @event = create(:event, user: @mary)
  end

  context 'logged in as the event owner' do
    before do
      login_as @mary
      visit event_path(@event)  
    end

    it 'should have a link to edit the event' do
      expect(page).to have_css '#edit-event', text: 'Edit'
    end

    it 'should allow you to edit the event' do
      click_link 'Edit'
      fill_in 'Name', with: 'Virgin London Marathon'
      click_on 'Update Event'
      expect(page).to have_content 'Virgin London Marathon'
      expect(current_path).to eq event_path(@event) 
    end

    it 'should show a link to add a profile picture' do
      expect(page).to have_css '#profile-image a', text: 'Add Profile Pic'
    end

    it 'can attach an image to a profile' do
      click_link 'Add Profile Picture'
      attach_file 'Avatar', Rails.root.join('app/assets/images/run.jpg')
      click_button 'Update User'
      expect(page).to have_css 'img.profile-pic'
      expect(current_path).to eq event_path(@event)
    end
  end

  context 'logged in as another user' do
    before do
      login_as @fred
      visit event_path(@event)
    end

    it 'should not have a link to edit the event' do
      expect(page).not_to have_css 'a.edit-event', text: 'Edit'
    end

    it 'should not allow you to edit the event' do
      visit edit_event_path(@event)
      expect(page).to have_content 'You are not the owner of the event'
      expect(current_path).to eq root_path
    end  

    it 'should not display a link to add a profile picture' do
      expect(page).not_to have_css '#profile-image a', text: 'Add Profile Pic'
    end  
  end
end