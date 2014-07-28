class Narrative < ActiveRecord::Base
	attr_accessible :narrative
	belongs_to :daily_report

end
