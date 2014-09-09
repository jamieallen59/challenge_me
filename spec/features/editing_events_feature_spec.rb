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
      click_link 'MENU'
      expect(page).to have_css '#edit-event'
    end

    it 'should allow you to edit the event' do
      click_link 'MENU'
      click_link 'EDIT'
      fill_in 'Name', with: 'Virgin London Marathon'
      click_on 'Update Event'
      expect(page).to have_content 'Virgin London Marathon'
      expect(current_path).to eq event_path(@event)
    end

    it 'should show a link to add a profile picture' do
      expect(page).to have_css '.icon-camera'
    end

    it 'should not display an image if no profile image is selected' do
      expect(page).not_to have_css 'img.profile-pic'
    end

    it 'can attach an image to a profile' do
      find('#profile-image a').click
      attach_file 'Avatar', Rails.root.join('app/assets/images/run.jpg')
      click_button 'Change profile picture'
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
      expect(page).not_to have_css '#edit-event'
    end

    it 'should not allow you to edit the event' do
      visit edit_event_path(@event)
      expect(page).to have_content 'You are not the owner of the event'
      expect(current_path).to eq root_path
    end

    it 'should not display a link to add a profile picture' do
      expect(page).not_to have_css '#profile-image a', text: 'Add Profile Pic'
    end

    it 'should not be able to edit someone elses profile' do
      visit profile_path(@mary)
      expect(current_path).not_to eq profile_path(@mary)
      expect(page).to have_content 'This is not your profile'
    end
  end
end