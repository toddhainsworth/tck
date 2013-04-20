class Ticket < ActiveRecord::Base
  attr_accessible :title, :description, :author, :resolved
end
