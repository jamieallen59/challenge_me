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
      wet_suit = @nyc_marathon.pledges.create(caption: "Wet Suit Challenge", amount: 300, text: "I will do a training run in my wetsuit")
      visit event_path(@nyc_marathon)
      expect(page).to have_content("Once I raise £300, I will do the Wet Suit Challenge")
      expect(page).to have_content("I will do a training run in my wetsuit")
    end

    it 'displays only the pledge closest to the current amount raised' do
      wet_suit = @nyc_marathon.pledges.create(caption: "Wet Suit Challenge", amount: 300, text: "I will do a training run in my wetsuit")
      sausage_challenge = @nyc_marathon.pledges.create(caption: "Sausage Challenge", amount: 30, text: "I will do a training run with sausages tied to me")
      visit event_path(@nyc_marathon)
      # raise @nyc_marathon.next_pledge.inspect
      expect(page).to have_content("Once I raise £30, I will do the Sausage Challenge")
      expect(page).to have_content("I will do a training run with sausages tied to me")
      # expect(page).not_to have_content("Wet Suit Challenge")
    end
  end
end