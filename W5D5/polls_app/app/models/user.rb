class User < ApplicationRecord
   validates :user_name, presence: true, uniqueness: true

    has_many :authored_polls
        primary_key: :id,
        foreign_key: author_id,
        class_name:  

    has_many :responses
end  