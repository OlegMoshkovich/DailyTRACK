class DailyReport < ActiveRecord::Base
	attr_accessible :narrative, :date
	has_many :inspections
	has_many :narratives
	before_create :ensure_date
	
	def ensure_date
		self.date = Date.today unless self.date
	end 	

	has_attached_file :image, styles: {
	    thumb: '100x100>',
	    original: '250x250>'
	}
	
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	def self.ensure_today
		daily_reports = DailyReport.where(date: Date.today)
    
		# ternary operator
		daily_report = daily_reports.present? ? daily_reports.first : DailyReport.create
		# daily_report = if daily_reports.present? 
		#     daily_reports.first 
		#   else 
		#     DailyReport.create
		# end

		daily_report
	end
	
	def self.to_csv
		CSV.generate do |csv|
		csv << column_names
			all.each do |wall|
			csv << wall.attributes.values_at(*column_names)
			end	
		end
	end

end


