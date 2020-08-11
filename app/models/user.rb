class User < ApplicationRecord

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :description,
    length: { maximum: 500 }

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  validates :encrypted_password,
    presence: true,
    length: { minimum: 2, maximum: 25 }#,
    #length: { maximum: 25 }

	has_many :participants
	has_many :users, through: :participants
end
