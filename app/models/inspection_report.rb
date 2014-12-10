class InspectionReport < ActiveRecord::Base
attr_accessible :inspector, :date, :contract, :contractor, :shift

	has_many :inspections
	has_many :notes
	has_many :forces

	belongs_to :user

end
