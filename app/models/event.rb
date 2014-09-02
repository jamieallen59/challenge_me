class Event < ActiveRecord::Base
  validates :name, format: { with: /\A[A-Z,a-z]/}, length: {minimum: 3}
  validates :event_date, presence: true
  validates :charity, presence: true
  validates :target, presence: true, numericality: true
  validates :amount_raised, presence: true, numericality: true
  validate :not_past_date

  has_many :posts
  has_many :pledges
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

  def next_pledge
     pledges.select{ |pledge| pledge.amount > amount_raised }.min_by{|pledge| pledge.amount }
  end

  def is_owner? user
    return false if user.nil?
    self.user_id == user.id
  end
end
