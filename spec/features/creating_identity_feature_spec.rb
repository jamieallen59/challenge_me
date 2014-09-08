require 'rails_helper'

describe 'Linking an api identity' do
  before do
    @user = create(:user)
  end

  context 'as a logged out user' do
    it 'should redirect to the sign in page' do
      visit '/auth/mapmyfitness'
      expect(page).to have_content 'You need to be logged in'
      expect(page).to have_content 'Log in'
    end
  end

  context 'as a logged in user' do
    before do
      login_as @user
      OmniAuth.config.mock_auth[:mapmyfitness] = OmniAuth::AuthHash.new({
        provider: 'mapmyfitness',
        uid: '123545',
        credentials: {
          token: 'abcdef',
          secret: 'secure'
        }
      })
    end
    
    it 'should authenticate' do
      visit '/auth/mapmyfitness'
      expect(page).to have_content 'Linked to map my fitness'
    end
  end
end