class DailyReport < ActiveRecord::Base
	attr_accessible :narrative, :date
	has_many :inspections
	before_create :ensure_date
	
	def ensure_date
		self.date = Date.today unless self.date
	end 	

	has_attached_file :image, styles: {
	    thumb: '100x100>',
	    square: '200x200#',
	    medium: '300x300>'
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
end