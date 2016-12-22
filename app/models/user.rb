class User < ActiveRecord::Base
	has_secure_password
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	pwd_regex   = /\A^(?=.*[a-z])(?=.*[A-Z])(?=.*\d.*)[a-zA-Z0-9\S]{8,15}\z/i

	has_many :minifigs
	has_many :comments
	has_many :minifig_comments, through: :minifigs, source: :comments

	validates :first_name, presence: true, length: { in: 2..48 }
	validates :last_name, presence: true, length: { in: 2..48 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: email_regex }
	validates :password, presence: true, length: { in: 8..15 }, format: { with: pwd_regex }, on: :create
end