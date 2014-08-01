class User < ActiveRecord::Base
	attr_accessible :username, :email, :password, :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 	has_many :inspection_reports


  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "user_prrofile_1.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
