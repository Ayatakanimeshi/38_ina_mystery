class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
end
