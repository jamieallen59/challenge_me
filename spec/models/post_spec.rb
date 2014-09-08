require 'rails_helper'

RSpec.describe Post, :type => :model do
  context 'Validations' do
    it 'is valid when the caption is greater than two characters' do
      post = Post.create(caption: "I'm so speedy")
      expect(post).to be_valid
    end

    it 'is not valid when the caption is less than two characters' do
      post = Post.create(caption: 'Hi')
      expect(post).to have(1).error_on(:caption)
    end

    it 'is not valid when the caption is longer than 140 characters' do
      post = Post.create(caption: 'C'*141)
      expect(post).to have(1).error_on(:caption)
    end

    it 'is not valid if the video url is not from youtube' do
      post = Post.create(caption: "I'm so speedy", video: "www.facebook.com")
      expect(post).to have(1).error_on(:video)
    end
  end

  context '#is_owner?' do
    before do
      @mary = create(:user)
      @fred = create(:fred)
      @event = create(:event, user: @mary)
      @post = create(:post, event: @event, user: @mary)
    end

    it 'should return true if user is owner of the post' do
      expect(@post.is_owner?(@mary)).to be true
    end

    it 'should return false if user is not the owner of the post' do
      expect(@post.is_owner?(@fred)).to be false
    end

    it 'should return false if nil user is passed in' do
      expect(@post.is_owner?(nil)).to be false
    end
  end
end

