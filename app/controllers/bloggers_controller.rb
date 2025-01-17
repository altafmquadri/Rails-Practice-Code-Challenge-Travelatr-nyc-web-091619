class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        @blogger.save
        redirect_to bloggers_path
    end

    def blogger_params 
        params.require(:blogger).permit(:name, :bio, :age)
    end
end