class Note < ActiveRecord::Base
	attr_accessible :observation
	belongs_to :inspection_report
end
