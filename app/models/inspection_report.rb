class InspectionReport < ActiveRecord::Base
	has_many :inspections
	has_many :notes
end
