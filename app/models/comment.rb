class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true


  validates :body, presence: true, length: {minimum: 2, maximum: 500}
end
