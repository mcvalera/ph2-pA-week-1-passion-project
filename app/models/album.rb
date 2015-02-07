class Album < ActiveRecord::Base

  belongs_to :user
  has_many :photos

  validates :description, length: { maximum: 500 }

end

# title, description