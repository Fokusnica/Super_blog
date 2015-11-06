class User < ActiveRecord::Base
	has_many :posts
has_secure_password

validates :email, presence: true, uniqueness: true
validates :name, presence: :true	
end
