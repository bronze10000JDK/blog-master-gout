class PostsController < ApplicationController

	def index

		@posts = Post.all.order(created_at: :desc)

		@hash = {}

		@posts.reverse.each do |post|
			@hash.update({post.created_at => Random.rand(11)})
		end
	end

	def show

		@post = Post.find(params[:id])
		@comments =@post.comments
		@new_comment = Comment.new(post_id: @post.id)

	end

	def new
		@post = Post.new

	end

	def create
		@post = Post.new(params.require(:post).permit(:title, :body))

		if @post.save
			redirect_to posts_path
		else
			render :new
		end

	end
end
