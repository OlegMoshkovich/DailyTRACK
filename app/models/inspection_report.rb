class InspectionReport < ActiveRecord::Base
	has_many :inspections
	has_many :notes

	has_attached_file :image
end
