require 'rails_helper'

RSpec.describe Pledge, :type => :model do
  context 'validations' do
    before do
      @mary = create(:user)
      @event = create(:event, user: @mary)
      login_as @mary
    end
    it 'is not valid with an amount that isnt a number' do
      pledge = @event.pledges.create(title: "my challenge", amount: 'asdf')
      expect(pledge).to have(2).error_on(:amount)
    end
    it 'is not valid unless title and amount are filled in' do
      pledge = Pledge.new(info: "I'm so pschyed to do this challenge")
      expect(pledge).to have(1).error_on(:title)
      expect(pledge).to have(2).error_on(:amount)
    end

    it 'it is not valid if the pledge amount is less or equal to the amount already raised' do
      pledge = @event.pledges.create(title: "my challenge", amount: 10)

      expect(pledge).to have(1).error_on(:amount)
    end

  end

end
