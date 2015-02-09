class Photo < ActiveRecord::Base

  belongs_to :user
  has_many :tags

  validates :description, length: { maximum: 200 }

# so that most recent photos are always on top when displayed
  default_scope { order(:id => :desc) }

end