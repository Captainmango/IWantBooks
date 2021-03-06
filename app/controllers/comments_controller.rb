class CommentsController < ApplicationController
    before_action :set_comment, only: [:update, :destroy, :show, :edit]
    def index
        if current_user
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
        else
            flash[:notice] = "Please sign up or sign"
            redirect_to "/"
        end
    end

    def new
        if current_user
            if params[:book_id] && !Book.exists?(params[:book_id])
                flash[:alert] = "Book not found"
                redirect_to books_path
            else
                @comment = Comment.new(book_id: params[:book_id], user_id: current_user.id)
            end
        else
            flash[:notice] = "Please sign up or sign"
            redirect_to "/"
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
        if @comment.user_id == current_user.id || current_user.admin
            @comment.update(comments_params)
            if @comment.save
                flash[:success] = "Comment updated"
                redirect_to @comment
            else
                flash[:alert] = @comment.errors
                render :edit
            end
        else
            flash[:alert] = "Cannot edit other users comments"
            redirect_to "/"
        end

    end

    def edit
        if current_user
            if params[:book_id]
                book = Book.find_by(id: params[:book_id])
                if book.nil?
                    flash[:alert] = "Book not found"
                    redirect_to books_paths
                else
                flash[:alert] = "Comment not found" if @comment.nil?
                redirect_to book_comments_path(book)
                end
            else
                redir_if_not_found(@comment)
            end
        else
            flash[:notice] = "Please sign up or sign"
            redirect_to "/"
        end
    end

    def destroy
        if @comment.user_id == current_user.id || current_user.admin
            @comment.destroy
            flash[:success] = "Successfully deleted comment"
            redirect_to "/"
        else
            flash[:alert] = "Cannot delete other people's comments"
            redirect_to book_path(@comment.book)
        end
    end

    def show
        if current_user
            if params[:book_id]
                @book = Book.find_by(id: params[:book_id])
                if @comment.nil?
                    flash[:alert] = "Comment not found"
                    redirect_to book_comments_path(@book)
                end
            else
                redir_if_not_found(@comment)
            end
        else
            flash[:notice] = "Please sign up or sign"
            redirect_to "/"
        end
    end
    
    private

    def comments_params
        params.require(:comment).permit(:content, :user_id, :book_id)
    end

    def set_comment
        @comment = Comment.find_by_id(params[:id])
    end

end
