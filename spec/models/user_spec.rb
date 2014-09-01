require 'rails_helper'

RSpec.describe User, :type => :model do
  context '#full_name' do
  	it 'returns the firstname and lastname of the user' do
  		user = create(:user)
  		expect(user.full_name).to eq 'Mary Perfect'
  	end
  end
end
