class Photo < ActiveRecord::Base

  belongs_to :album
  has_one :user, through: :album

  validates :description, length: { maximum: 200 }

end

# description, url
