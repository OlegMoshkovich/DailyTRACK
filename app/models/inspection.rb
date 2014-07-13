class Inspection < ActiveRecord::Base
	attr_accessible :heading, :element, :start, :finish, :operation
	 belongs_to :inspection_report
   belongs_to :daily_report

   before_save :ensure_daily_report

	 has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }


  def ensure_daily_report
    daily_reports = DailyReport.where(date: Date.today)
    
    # ternary operator
    daily_report = daily_reports.present? ? daily_reports.first : DailyReport.create
    # daily_report = if daily_reports.present? 
    #     daily_reports.first 
    #   else 
    #     DailyReport.create
    # end
    self.daily_report = daily_report
  end

	 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	  def self.search_for(query)
    where('heading LIKE :query OR element LIKE :query OR operation LIKE :query', query: "%#{query}%")
  end
end 
