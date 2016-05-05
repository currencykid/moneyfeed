class Comment < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  belongs_to :user
  belongs_to :post
  validates :body, presence: true, length: {minimum: 1, maximum: 500}
end
