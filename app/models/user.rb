class User < ActiveRecord::Base

  include BCrypt

  has_many :photos
  has_many :tags, through: :photos

  validates :username, :email, :password_hash, presence: true

  validates :username, :email, uniqueness: true
  validates_format_of :email, :with => /[\w]+[@][\w]+[.][\w]{2,}/

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
