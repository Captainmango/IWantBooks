class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def new
        @book = current_user.books.new
        @book.title = params["volumeInfo"]["title"]
        @book.author = params["volumeInfo"]["authors"].first
        @book.self_link = params["selfLink"]
        @book.preview_link = params["volumeInfo"]["previewLink"]
    end

    def create
        @book = current_user.books.create(book_params)
        if @book.save
            flash[:success] = "Book added to library successfully."
            redirect_to book_path(@book)
        else
            @book = Book.find_by(title: params[:book][:title])
            flash[:warning] = "A user already has this book in their library."
            @book.users.ids << current_user.id
            redirect_to book_path(@book)
        end
    end

    def edit
        @book = Book.find_by_id(params[:id])
    end

    def update
        @book = Book.find_by_id(params[:id])
        @book.update(book_params)
        @book.save
        flash[:success] = "Successfully updated book"
        redirect_to book_path(@book)
    end

    def destroy
        @book = Book.find_by_id(params[:id])
        @book.comments.destroy_all
        @book.destroy
        flash[:success] = "Successfully deleted book"
        redirect_to "/"
    end

    def show
        @book = Book.find_by_id(params[:id])
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :self_link, :preview_link)
    end

end
