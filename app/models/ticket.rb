class Ticket < ActiveRecord::Base
	attr_accessible :title, :description, :author, :resolved

	validates :title, presence: true
	validates :description, presence: true
	validates :description, :length => { minimum: 20 }
end
