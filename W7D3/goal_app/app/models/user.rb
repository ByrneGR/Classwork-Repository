class User < ApplicationRecord
    validates :email, presence: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6 }

    attr_reader :password

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    has_many :goals,
        foreign_key: :user_id,
        class_name: :Goal 

    def is_password?(password)
      BCrypt::Password.new(password_digest).is_password?(password)
    end  

    def self.find_by_credentials(email, password)
      user = User.find_by(email: email)
      user && user.is_password?(password) ? user : nil
    end  
end
