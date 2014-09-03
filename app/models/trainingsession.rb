class Trainingsession < ActiveRecord::Base
  belongs_to :event
  validates :details, presence: true
end
