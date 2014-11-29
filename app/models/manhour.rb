class Manhour < ActiveRecord::Base
	attr_accessible :heading
	belongs_to :inspection_report

end
