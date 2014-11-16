class PostsController < ApplicationController

	include PostsHelper
	# before_filter :require_all_fields, only: [:create]

	def index
		@posts = Post.all
	end

	def show
		@user = current_user
		@post = Post.find(params[:id])
	end 

	def new
		@post = Post.new

	end

	def create
		@post = Post.create(post_params)
		@post.user = current_user.email
		@post.save
		if @post.id
			redirect_to post_path(@post)
		else 
			redirect_to posts_path
		end
	end

	# def require_all_fields
	# 	@post = Post.new(post_params)
	# 	@post.save
	# 	unless @post.title && @post.content
	# 		flash.notice = "please fill out the whole form"
	# 		return false
	# 	end
	# end
end
