class CommentsController < ApplicationController

    def index
        if params[:book_id]
            @book = Book.find_by(id: params[:book_id])
            if @book.nil?
                flash[:alert] = "Book not found"
                redirect_to books_path
            else
              @comments = @book.comments
            end
          else
            @comments = Comment.all
        end

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
        @comment = Comment.create(comments_params)
        if @comment.save
            flash[:success] = "Comment created successfully"
            redirect_to book_path(@comment.book)
        else
            flash[:alert] = @comment.errors
            render "new"
        end

    end

    def update
        @comment = Comment.find_by_id(params[:id])

        @comment.update(comments_params)
    
        if @comment.save
            flash[:success] = "Comment updated"
          redirect_to @comment
        else
            flash[:alert] = @comment.errors
            render :edit
        end

    end

    def edit
        if params[:book_id]
            book = Book.find_by(id: params[:book_id])
            if book.nil?
                flash[:alert] = "Book not found"
                redirect_to books_path
            else
              @comment = book.comments.find_by(id: params[:id])
              flash[:alert] = "Song not found" if @comment.nil?
              redirect_to book_comments_path(book)
            end
          else
            @comment = Comment.find_by_id(params[:id])
          end
    end

    def destroy
        @comment = Comment.find_by_id(params[:id])
        @comment.destroy
        flash[:success] = "Successfully deleted comment"
        redirect_to "/"
    end

    def show
        if params[:book_id]
            @book = Book.find_by(id: params[:book_id])
            @comment = @book.comments.find_by(id: params[:id])
            if @comment.nil?
                flash[:alert] = "Comment not found"
                redirect_to book_comments_path(@book)
            end
          else
            @comment = Comment.find_by_id(params[:id])
          end
    end
    
    private

    def comments_params
        params.require(:comment).permit(:content, :user_id, :book_id)
    end
end
