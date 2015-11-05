class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	belongs_to :comment
	belongs_to :commentable, :polymorphic => true
	has_many :comments, :as => :commentable


	def post
		return @post if defined?(@post)
		@post = commentable.is_a?(Post) ? commentable : commentable.post
 # if “commentable” (the parent object) is a post, return that. Otherwise, call this same method on the parent, which will in turn check if *it* is a Post, and so on.
end

end
