class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user, dependent: :destroy
  validates :content, presence: true, length: {minimum: 2, maximum: 500}


end
