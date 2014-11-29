class Force < ActiveRecord::Base
	attr_accessible :heading, :union147, :union15, :union14, :union731, :union3
	belongs_to :inspection_report
end
