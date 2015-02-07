class User < ActiveRecord::Base

  has_many :albums
  has_many :photos, through: :albums

  validates :username, :email, :password, presence: true
  validates :username, :email, :password, uniqueness: true
  validates_format_of :email, :with => /[\w]+[@][\w]+[.][\w]{2,}/

end

  # fname, lname, username, email, pword
