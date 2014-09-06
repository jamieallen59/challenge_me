require 'rails_helper'

RSpec.describe Trainingsession, :type => :model do
  context 'validations' do 

  	before do
      @mary = create(:user)
      @event = create(:event, user: @mary)
      login_as @mary
    end

  	it 'is not valid if the details part is empty' do 
  		workout = @event.trainingsessions.create
  		expect(workout).to have(1).error_on(:details)
  	end
  end

end
