class CommentsController < ApplicationController
	before_filter :get_parent

	def new 
		@comment = @parent.comments.build
	end

	def create
		@comment = @parent.comments.build(comment_params.merge(:user_id => current_user.id))

		if @comment.save
			redirect_to post_path(@comment.post), notice: 'Thank you for your comment!'
		else
			render :new
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to posts_path
	end

		def update
		@comment = Comment.find(params[:id])
		@comment.update(comment_params)

		flash.notice = "Comment Updated!"


		redirect_to comment_path(@comment)
	end

	protected

	def get_parent
		@parent = Post.find_by_id(params[:post_id]) if params[:post_id]
		@parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
		
		redirect_to root_path unless defined?(@parent)
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end



end
