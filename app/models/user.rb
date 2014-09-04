class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:mapmyfitness]

  validates :firstname, presence: true, format: {with: /\A[a-zA-Z]+\Z/ }
  validates :lastname, presence: true, format: {with: /\A[a-zA-Z]+\Z/ }
  has_many :events, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def full_name
  	[firstname, lastname].join(' ')
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.firstname = auth.info.first_name
    user.lastname = auth.info.last_name
  end
end
end
