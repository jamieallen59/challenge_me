class Challenge < ActiveRecord::Base
	belongs_to :event
  # after_create :create_challenge_post

  def create_challenge_post(status)
  	self.status = status
  	self.save
  	event.posts.create(caption: "#{event.user.firstname} #{status} #{self.creator}'s challenge", text: self.name)

  end

end
