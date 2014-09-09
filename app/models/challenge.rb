class Challenge < ActiveRecord::Base
	belongs_to :event
  after_create :create_challenge_post
  def create_challenge_post
  	event.posts.create(caption: self.creator, text: self.name)
  end

end
