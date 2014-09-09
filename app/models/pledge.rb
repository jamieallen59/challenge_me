class Pledge < Post
  belongs_to :event
  validates :caption, presence: true
  validates :amount, presence: true, numericality: true
  validate :pledge_check

  def pledge_check
    if amount.present? && amount <= event.amount_raised
    errors.add(:amount, 'you have already raised this amount')
    end
  end

  def title
    caption
  end

  def info
    text
  end

  def self.model_name
    Post.model_name
  end

end
