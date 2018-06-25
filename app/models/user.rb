class User < ApplicationRecord
  has_secure_password()
  has_many :providers, dependent: :destroy
  has_many :dishes, dependent: :destroy
  
  validates :user_name, :full_name, presence: true, uniqueness: {case_sensitive: false}
  
  validates(
    :email,
    presence: true,
    uniqueness: true,
    uniqueness: {case_sensitive: false},
    format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
    }
  )

  after_validation { self.errors.messages.delete(:password_digest) }
  
end
