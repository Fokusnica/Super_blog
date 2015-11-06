class User < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "300*300", :thumb => "100*100", :com => "64*64" }
	has_many :posts
	has_secure_password

	validates :email, presence: true, uniqueness: true
	validates :name, presence: :true	
end
