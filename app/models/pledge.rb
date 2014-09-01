class Pledge < ActiveRecord::Base
  belongs_to :event
  validates :title, presence: true
  validates :amount, presence: true, numericality: true
  validate :pledge_check

  def pledge_check
    if amount.present? && amount <= event.amount_raised
    errors.add(:amount, 'you have already raised this ammount')
    end
  end


end
