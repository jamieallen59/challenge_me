require 'rails_helper'

describe 'Linking an api identity' do
  before do
    user = create(:user)
    
  end

  context 'as a logged out user' do
    xit 'should redirect to the sign in page' do
      visit '/auth/mapmyfitness'
      expect(page).to have_content 'Log in'
    end
  end
end