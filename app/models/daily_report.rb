class DailyReport < ActiveRecord::Base
	attr_accessible :narrative, :date
	has_many :inspections
	before_create :ensure_date
	
	def ensure_date
		self.date = Date.today
	end 	

has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
	 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
