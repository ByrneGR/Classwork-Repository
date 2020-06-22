class User < ApplicationRecord

  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true

  after_initialize :ensure_session_token 

  def reset_session_token! #make and return a new token each session
    self.session_token = self.class.generate_session_token
    self.save! 
    self.session_token
  end 

  attr_reader :password

  def password=(password) #setting the instance variable to password and then creating an encrypted version of the password
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password) #generate new BCrypt for argument and see if the Bcrypt code matches the Bcrypt of the actual password 
    bc_password = BCrypt::Password.new(self.password_digest)
    bc_password.is_password?(password)
  end 

  def self.find_by_credentials(user_name, password)
    user = User.find_by(username: user_name) #does the user exit? user = nil if not found
    if user && user.is_password?(password) #return the user if both the user exists and the password is correct
      return user
    else
      nil
    end     
  end  
  private 

  def ensure_session_token #ensures a token exists and generates one if there is none
    self.session_token ||= self.class.generate_session_token
  end 

  def self.generate_session_token
    SecureRandom.urlsafe_base64 #generate a random string in base64
  end

end
