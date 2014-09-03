require 'rails_helper'

describe 'Creating training sessions' do

	before(:each) do 
 	  	@mary = create(:user)
    	@event = create(:event, user: @mary)
    end

    it "let's the user fill in details about their session" do
    	visit event_path(@event)
    	click_link 'Log training session'
    	fill_in 'Training details', with: "I ran through a park"
    	click_button "Add Workout"
    	expect(page).to have_content "I ran through a park"
    end 

end
