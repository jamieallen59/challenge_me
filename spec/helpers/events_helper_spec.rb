require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, :type => :helper do

	describe 'event countdown' do
		before(:each) do 
			@race = create(:event)
		end

		it 'provides a countdown of the number of days remaining' do 
			Timecop.freeze(Time.local(2014, 9, 1, 10, 5, 0)) do 
				visit event_path(@race)
				expect(page).to have_content("11 days to go!")
			end
		end

		it 'displays "Event Day" on day of event' do
			Timecop.freeze(Time.local(2014, 9, 12, 10, 5, 0)) do 
				visit event_path(@race)
				expect(page).to have_content("Today's the day!")
			end
		end

		it 'displays "Event Complete" after event date' do
			Timecop.freeze(Time.local(2014, 9, 14, 10, 5, 0)) do 
				visit event_path(@race)
				expect(page).to have_content("Event completed 2 days ago!")
			end
		end

	end

	describe 'percentage of fundraising target achieved' do 
		before(:each) do 
			@race = create(:event)
		end

		it 'when the target has not been reached it provides a percentage of the amount raised' do 
			visit event_path(@race)
			expect(page).to have_content("1% of fundraising target achieved")
		end

		it 'when the target has been reached it displays the exceeded percentage' do
			@marathon = create(:event, amount_raised: 1100.0)
			visit event_path(@marathon)
			expect(page).to have_content("110% of fundraising target achieved")
		end
	end

end
