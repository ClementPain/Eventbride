class Event < ApplicationRecord

	validates :title, presence: true, length: {in: 5..140}
	validates :duration, presence: true, length: {in: 20..1000}
	validates :price, presence: true, inclusion: { in: 1..1000 }
	validates :location, presence: true
	validates :start_date, presence: true

	this_duration = :duration
	validates :duration, presence: true	
	has_many :participants
	has_many :users, through: :participants
end