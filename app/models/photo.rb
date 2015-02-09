class Photo < ActiveRecord::Base

  belongs_to :user
  has_many :tags

  validates :description, length: { maximum: 200 }

end