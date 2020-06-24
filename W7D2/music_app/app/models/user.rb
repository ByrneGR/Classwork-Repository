class User < ApplicationRecord
  #validates :password, minimum length #this works with the @password instance variable and this is why you need attr_reader

  attr_reader :password #need this for the password validation
  after_initialize :ensure_session_token # this is a callback - checks that the session token is there before attempting to validate. Will generate a new one if not present.
          
  def self.generate_session_token #generate a SecureRandom base64 string
    SecureRandom.urlsafe_base64
  end
  
  def reset_session_token! #set session_token to the newly generated session_token, save it, and return it
    self.session_token = self.class.generate_session_token
    self.save! #save so the new session_token is added to the database/also makes sure this session token is unique
    self.session_token
  end
  
  def ensure_session_token #checks to make sure the instance has a session token, if not, generates one
    self.session_token ||= self.class.generate_session_token
  end 
  
  def password=(password) #make a password_digest for our password with BCrypt
    @password = password #need for password validation
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password) #check if the attempted password matches our password_digest
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end  

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email) #find the user by their email
    return nil if user.nil? #if the email doesn't match an existing user, return nil
    user.is_password?(password) ? user : nil #if the user's password is correct, return the user, if not, return nil
  end  

end   


# #questions:
# # 1) why do we need to save! the session_token and not the password_digest?
# 2) why do we need to set the instance variable (@password) since this isn't a column in the users table?
# 3) why do we not have #intialize in these classes anymore?
# 4) what does the sessions hash look like?


# 1) save is called on the password= under the hood when you call it in the users controller
#  reset session token is only called on existing users and password = is for new user
#  3) active record has intialize, which we inherit from and so initialize gets called everytime we do .new or.create