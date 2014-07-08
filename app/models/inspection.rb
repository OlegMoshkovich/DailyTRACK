class Inspection < ActiveRecord::Base
	attr_accessible :heading, :element, :start, :finish, :operation
	 belongs_to :inspection_report
end
