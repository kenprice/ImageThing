class User < ActiveRecord::Base
  has_secure_password #method to add security to passwords
                      #allows access to :password and :password_confirmation
                      #virtual attributes
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = self.email.downcase }
  validates :email, presence: true, 
                      length: { maximum: 200 }, 
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
  validates :name, length: { maximum: 60 }
  validates :password, length: { minimum: 6 }
end
