class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  default_scope { order('cached_votes_score DESC') }

  validates :title, presence: true, length: {minimum: 1, maximum: 300}
  validates :url, presence: true
  validates :user_id, presence: true

end
