class CommentsController < ApplicationController

    def index
    end

    def new
    end

    def create
    end

    def update
    end

    def edit
    end

    def destroy
    end

    def show
    end
    
    private

    def comments_params
        params.require(:book).permit(:title, :author, :self_link, :preview_link)
    end
end
