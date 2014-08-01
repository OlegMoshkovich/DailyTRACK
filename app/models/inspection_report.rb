class InspectionReport < ActiveRecord::Base
attr_accessible :inspector, :date

	has_many :inspections
	has_many :notes
	belongs_to :user

end
