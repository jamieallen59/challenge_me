require 'rails_helper'

RSpec.describe Post, :type => :model do
  context 'Validations' do
    it ' is valid when the caption is greater than two characters' do
      post = Post.create(caption: "I'm so speedy")
      expect(post).to be_valid
    end

    it 'is not valid when the caption is less than two characters' do
      post = Post.create(caption: 'Hi')
      expect(post).to have(1).error_on(:caption)
    end

    it 'it is not valid when the caption is longer than 140 characters' do
      post = Post.create(caption: 'C'*141)
      expect(post).to have(1).error_on(:caption)
    end
  end
end
