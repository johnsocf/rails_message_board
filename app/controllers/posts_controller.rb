class PostsController < ApplicationController

	include PostsHelper

	def index
		@posts = Post.all
	end

	def show
		@user = User.find(params[:id])
		@post = Post.find(params[:id])
	end 

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to post_path(@post)
	end
end
