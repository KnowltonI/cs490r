class Event < ActiveRecord::Base
	has_many :comments
	has_many :users, through: :comments

	validates :name, presence: true
	validates :priority, presence: true, numericality: true
end
