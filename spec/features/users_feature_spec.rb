require 'rails_helper'

describe 'creating user' do
  it 'is created with a first and last name' do
    visit new_user_registration_path
    fill_in 'First Name', with: 'Toan'
    fill_in 'Last Name', with: 'Nguyen'
    fill_in 'Email', with: 'toan@challengeme.com'
    fill_in 'Password', with: 'challengeme'
    fill_in 'Password confirmation', with: 'challengeme'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it 'displays an error message if form is filled out incorrectly' do
    visit new_user_registration_path
    fill_in 'First Name', with: ''
    fill_in 'Last Name', with: 'Nguyen'
    fill_in 'Email', with: 'toan@challengeme.com'
    fill_in 'Password', with: 'challengeme'
    fill_in 'Password confirmation', with: 'challengeme'
    click_button 'Sign up'
    expect(page).to have_content 'error'
  end
end