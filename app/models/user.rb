class User < ApplicationRecord
  validates_length_of :password, minimum: 6
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  def self.authenticate_with_credentials(email, password)
    user = self.find_by(email: email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end  
end
