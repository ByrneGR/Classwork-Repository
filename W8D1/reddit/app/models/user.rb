# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :username, :password_digest, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password

  has_many :subs,
    foreign_key: :moderator_id,
    class_name: :Sub

  after_initialize :ensure_session_token

  # has_many :posts
    
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.is_password?(password)
    user
  end  

  def is_password?(password)
    bc_password = BCrypt::Password.new(self.password_digest)
    bc_password.is_password?(password)
  end  

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end  

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end  

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end  

  



end
