class Post < ActiveRecord::Base
  acts_as_votable

  extend FriendlyId
    friendly_id :title, use: [:finders, :slugged]


  belongs_to :user, dependent: :destroy 
  has_many :comments, dependent: :destroy
  # default_scope { order('cached_votes_score DESC') }
  default_scope { order('created_at DESC') }

  validates :title, presence: true, length: {minimum: 2, maximum: 300}
  validates :url, presence: true
  validates :user_id, presence: true

end
