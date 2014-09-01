require 'rails_helper'

RSpec.describe Comment, :type => :model do
  describe 'validations' do
    before do
      @mary = create(:user)
      event = create(:event, user: @mary)
      @post = create(:post, user: @mary, event: event)
    end

    it 'is valid if comments is greater that 3 characters and less than 140 characters' do
      comment = Comment.new(comments: 'This is great!', user: @mary, post: @post)
      expect(comment).to be_valid
    end

    it 'is invalid if comments is less than 3 characters' do
      comment = Comment.new(comments: 'YO', user: @mary, post: @post)
      expect(comment).to have(1).errors_on(:comments)
    end

    it 'is invalid if comments is greater than 140 characters' do
      comment = Comment.new(comments: 'Y'*141 , user: @mary, post: @post)
      expect(comment).to have(1).errors_on(:comments)
    end
  end
end
