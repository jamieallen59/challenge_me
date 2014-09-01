require 'rails_helper'

describe ' displaying pledges' do
   before(:each) do
      mary = create(:user)
      @nyc_marathon = create(:event, user: mary)
    end
  context ' with no pledges' do
    it 'displays a message' do
      visit event_path(@nyc_marathon)
      expect(page).to have_content 'No pledges yet'
    end
  end
  context ' with  pledges' do

    it 'displays the pledge information' do
      wet_suit = @nyc_marathon.pledges.create(title: "Wet Suit Challenge", amount: 300, info: "I will do a training run in my wetsuit")
      visit event_path(@nyc_marathon)

      expect(page).to have_content("Once I raise £300, I will do the Wet Suit Challenge")
      expect(page).to have_content("I will do a training run in my wetsuit")
    end

    it 'displays only the pledge closest to the current amount raised' do
      sausage_challenge = @nyc_marathon.pledges.create(title: "Sausage Challenge", amount: 30, info: "I will do a training run with sausages tied to me")
      wet_suit = @nyc_marathon.pledges.create(title: "Wet Suit Challenge", amount: 300, info: "I will do a training run in my wetsuit")
      visit event_path(@nyc_marathon)
      expect(page).to have_content("Once I raise £30, I will do the Sausage Challenge")
      expect(page).to have_content("I will do a training run with sausages tied to me")
      expect(page).not_to have_content("Wet Suit Challenge")
    end
  end

end