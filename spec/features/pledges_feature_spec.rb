require 'rails_helper'

describe 'displaying pledges' do
 before(:each) do
    mary = create(:user)
    @nyc_marathon = create(:event, user: mary)
  end

  context 'with no pledges' do
    it 'displays a message' do
      visit event_path(@nyc_marathon)

      expect(page).to have_content "Mary hasn't promised to do anything yet..."
    end
  end

  context 'with pledges' do
    it 'displays the pledge information' do
      wet_suit = @nyc_marathon.pledges.create(amount: 300,title: "do the Wet Suit Challenge",  info: "I will do a training run in my wetsuit")
      visit event_path(@nyc_marathon)
      expect(page).to have_content("Once I raise £300, I will do the Wet Suit Challenge")
    end

    it 'displays only the pledge closest to the current amount raised' do
      wet_suit = @nyc_marathon.pledges.create(title: "Wet Suit Challenge", amount: 300, info: "I will do a training run in my wetsuit")
      sausage_challenge = @nyc_marathon.pledges.create(amount: 30, title: "do the Sausage Challenge",  info: "I will do a training run with sausages tied to me")
      visit event_path(@nyc_marathon)
      expect(page).to have_content("Once I raise £30, I will do the Sausage Challenge")
      expect(page).not_to have_content("Wet Suit Challenge")
    end
  end
end