class Inspection < ActiveRecord::Base
	attr_accessible :heading, :element, :start, :finish, :operation
	 belongs_to :inspection_report

	  def self.search_for(query)
    where('heading LIKE :query OR element LIKE :query OR operation LIKE :query', query: "%#{query}%")
  end
end 
