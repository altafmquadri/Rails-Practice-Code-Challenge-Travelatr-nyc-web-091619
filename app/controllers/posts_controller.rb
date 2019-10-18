class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(post_params)
        @post.likes = 0
        @post.save
        redirect_to posts_path
    end

    def post_params
        params.require(:post).permit(:title, :blogger_id, :destination_id, :content, :likes => 0)
    end

end
