class Tag < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :photo
  has_one :user, through: :photo

  validates :description, length: { maximum: 50 }

end
