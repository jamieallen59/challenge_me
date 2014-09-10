class Trainingsession < ActiveRecord::Base
  belongs_to :event
  validates :details, presence: true
  after_initialize :defaults
  after_create :create_training_post

  def defaults
        self.sessiondate ||= Date.today
  end

  def create_training_post
    if self.mmf_route_id.nil?
      event.posts.create(caption: "Training complete for #{self.sessiondate.strftime('%d %B %y')}", text: self.details, user_id: event.user.id)
    else
      event.posts.create(caption: self.details, user_id: event.user.id, url: "http://snippets.mapmycdn.com/routes/view/embedded/#{self.mmf_route_id}?width=500&height=206&&line_color=E60f0bdb&rgbhex=DB0B0E&distance_markers=0&unit_type=imperial&map_mode=ROADMAP&last_updated=#{self.mmf_updated_datetime}&show_marker_every=4" )
    end

  end

end
