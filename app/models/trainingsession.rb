class Trainingsession < ActiveRecord::Base
  belongs_to :event
  validates :details, presence: true
  after_initialize :defaults

  def defaults
        self.sessiondate ||= Date.today
  end

end
