class Challenge < ActiveRecord::Base
	belongs_to :event
  def create_challenge_post(status)
  	self.status = status
  	self.save
  	event.posts.create(caption: "#{event.user.firstname} #{status} #{self.creator}'s challenge", text: "#{self.creator} will give £#{self.amount} to #{self.name}!")
  end

end
