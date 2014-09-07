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

  has_attached_file :avatar, :styles => { :medium => "230x230#" },
    storage: :s3,
    s3_credentials: {
      bucket: 'challengeme',
      access_key_id: Rails.application.secrets.s3_access_key_id,
      secret_access_key: Rails.application.secrets.s3_access_access_key
    }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def full_name
  	[firstname, lastname].join(' ')
  end

  def self.search(query)
    where("firstname like ?", "%#{query}")
  end

end
