class User < ActiveRecord::Base
	has_many :comments
	has_many :events, through: :comments
	has_secure_password

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true
	validates :name, presence: true
	attr_accessor :terms
end
