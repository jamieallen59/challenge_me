class Event < ActiveRecord::Base
  validates :name, format: { with: /\A[A-Z,a-z]/}, length: {minimum: 3}
  validates :event_date, presence: true
  validates :charity, presence: true
  validates :target, presence: true, numericality: true
  validates :amount_raised, presence: true, numericality: true
  validate :not_past_date

  has_many :posts
  belongs_to :user

  def not_past_date
    if event_date.present? && event_date < Date.today
      errors.add(:event_date, 'not in past')
    end
  end

  def days_remaining
    return "Today's the day!" if event_date == Date.today
    if event_date > Date.today
      return "#{(event_date - Date.today).to_i} days to go!"
    else
      return "Event completed #{(Date.today - event_date).to_i} days ago!"
    end
  end

  def percentage_of_target
    ((amount_raised/target)*100).to_i
  end

end
