class Inspection < ActiveRecord::Base
	attr_accessible :heading, :element, :start, :finish, :operation
	 belongs_to :inspection_report

	 has_attached_file :image
	 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	  def self.search_for(query)
    where('heading LIKE :query OR element LIKE :query OR operation LIKE :query', query: "%#{query}%")
  end
end 
