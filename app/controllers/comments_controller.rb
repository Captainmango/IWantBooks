class CommentsController < ApplicationController

    def index

    end

    def new
        if params[:book_id] && !Book.exists?(params[:book_id])
            flash[:alert] = "Book not found"
            redirect_to books_path
        else
            @comment = comment.new(book_id: params[:book_id], user_id: current_user.id)
        end
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
        params.require(:comment).permit(:content, :user_id, :book_id)
    end
end
