class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_one_attached :avatar

    validates :name, :username, :password, :password_confirmation, presence: true
    validates :username, uniqueness: true
end
