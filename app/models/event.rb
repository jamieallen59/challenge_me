class Event < ActiveRecord::Base
  validates :name, format: { with: /\A[A-Z,a-z]/}, length: {minimum: 3}
  validates :event_date, presence: true
  validates :charity, presence: true
  validates :target, presence: true, numericality: true
  validates :amount_raised, presence: true, numericality: true
  validate :not_past_date
  validates :training, presence: true
  validates :user_id, uniqueness: {scope: :jg_event_id, message: 'You have already created the same event'}

  has_many :posts, dependent: :destroy
  has_many :pledges, dependent: :destroy
  has_many :trainingsessions, dependent: :destroy
  belongs_to :user

  def not_past_date
    if event_date.present? && event_date < Date.today
      errors.add(:event_date, 'not in past')
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

  def weekly_training_sessions
    trainingsessions.count{|session| session.cweek == Date.today.cweek}
  end

  def days_to_event
    ((event_date.to_time - created_at) / 3600) / 24
  end

  def percentage_of_workouts_complete
    workouts_per_week = (days_to_event / 7) * training
    ((trainingsessions.count / workouts_per_week) * 100)
  end

end
