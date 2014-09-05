class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, presence: true, format: {with: /\A[a-zA-Z]+\Z/ }
  validates :lastname, presence: true, format: {with: /\A[a-zA-Z]+\Z/ }
  has_many :events, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :identities, dependent: :destroy

  def full_name
  	[firstname, lastname].join(' ')
  end

end
