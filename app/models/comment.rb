class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :comments, length: {in: 3..140 }
end
