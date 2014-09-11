require 'rails_helper'

RSpec.describe Challenge, :type => :model do
  describe '#create_challenge_post' do
    it 'will create a new post' do
      user = create(:user)
      event = create(:event, user: user)
      challenge = create(:challenge, event: event)
      post = challenge.create_challenge_post('accepted')
      expect(post.caption).to eq "Mary accepted Mike's challenge"
      expect(post.text).to eq "Mike will give £50 to Pour water on your head and i'll give you £5!"
    end
  end
end