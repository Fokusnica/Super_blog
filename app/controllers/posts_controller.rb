class PostsController < ApplicationController
	
	before_action :authenticate_user!, :except => [:index]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params.merge(:user_id => current_user.id))

		if @post.save
			redirect_to posts_path, notice: "Your post was created successfully."
		else
			render :action => :new
		end
	end
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end


	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)

		flash.notice = "Post '#{@post.title}' Updated!"


		redirect_to post_path(@post)
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end




end
