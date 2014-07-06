require 'csv'

class ConcreteSummary < ActiveRecord::Base
	attr_accessible :date, :baseline_early_ind, :baseline_early_cum, :baseline_late_ind, :baseline_late_cum 


	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			ConcreteSummary.create! row.to_hash
			#binding.pry
		end
	end


	
end
