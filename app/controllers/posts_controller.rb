class PostsController < ApplicationController
	before_action :get_post, except: [:index, :create, :new ]

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def show
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to post_path @post
		else
			render 'edit'
		end
	end

	def destroy
		if @post.destroy
			redirect_to root_path
		#else
			#render 'edit'
		end		
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def get_post
		@post = Post.find(params[:id])
	end


end
