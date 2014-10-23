class Inspection < ActiveRecord::Base
	attr_accessible :heading, :element, :start, :finish, :operation, :scope
	 belongs_to :inspection_report
   belongs_to :daily_report

   before_save :ensure_daily_report

	 has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
  
  processors: [:thumbnail, :compression],
   :default_url => "missing.png"

  def ensure_daily_report
    self.daily_report = DailyReport.ensure_today unless self.daily_report
  end
	 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	def self.search_for(query)
    where('heading LIKE :query OR element LIKE :query OR operation LIKE :query', query: "%#{query}%")
  end
end 
