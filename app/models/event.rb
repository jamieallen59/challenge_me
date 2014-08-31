class Event < ActiveRecord::Base
  validates :name, format: { with: /\A[A-Z,a-z]/}, length: {minimum: 3}
  validates :event_date, presence: true
  validates :charity, presence: true
  validates :target, presence: true, numericality: true
  validates :amount_raised, presence: true, numericality: true
  validate :not_past_date


  def not_past_date
    if event_date.present? && event_date < Date.today
      errors.add(:event_date, 'not in past')
    end
  end
end
