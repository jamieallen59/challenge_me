require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'validations' do
    it 'is invalid if firstname is empty' do
      user = User.new(lastname: 'Perfect', email: 'maryperfect@challengme.com', password: 'littlelamb', password_confirmation: 'littlelamb')
      expect(user).to have(2).error_on(:firstname)
    end 

    it 'is invalid if lastname is empty' do
      user = User.new(firstname: 'Mary', email: 'maryperfect@challengme.com', password: 'littlelamb', password_confirmation: 'littlelamb')
      expect(user).to have(2).error_on(:lastname)
    end

    it 'is invalid if firstname contains a non character value' do
      user = User.new(firstname:'mary11', lastname: 'Perfect', email: 'maryperfect@challengme.com', password: 'littlelamb', password_confirmation: 'littlelamb')
      expect(user).to have(1).error_on(:firstname)
    end

    it 'is invalid if last contains a non character value' do
      user = User.new(lastname:'Perfect10', firstname: 'Perfect', email: 'maryperfect@challengme.com', password: 'littlelamb', password_confirmation: 'littlelamb')
      expect(user).to have(1).error_on(:lastname)
    end 
  end

  context '#full_name' do
  	it 'returns the firstname and lastname of the user' do
  		user = create(:user)
  		expect(user.full_name).to eq 'Mary Perfect'
  	end
  end
end
