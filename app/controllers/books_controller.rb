class BooksController < ApplicationController

    def index
        if current_user
            if current_user.admin
                @books = Book.all
            else
                flash[:notice] = "Only admins can be here"
                redirect_to "/"
            end
        else
            flash[:notice] = "Please sign up or sign"
            redirect_to "/"
        end
    end

    def new
        if current_user
            @book = current_user.books.new
            @book.title = params["volumeInfo"]["title"]
            @book.author = params["volumeInfo"]["authors"].first
            @book.self_link = params["selfLink"]
            @book.preview_link = params["volumeInfo"]["previewLink"]
        else
            flash[:notice] = "Please sign up or sign"
            redirect_to "/"
        end
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
        if current_user
            @book = Book.find_by_id(params[:id])
            redir_if_not_found(@book)
        else
            flash[:notice] = "Please sign up or sign"
            redirect_to "/"
        end
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
        if current_user
            @book = Book.find_by_id(params[:id])
            redir_if_not_found(@book)
        else
            flash[:notice] = "Please sign up or sign"
            redirect_to "/"
        end
    end

    def most_recent_book
        @book = Book.most_recent_book
        render :show
    end


    private

    def book_params
        params.require(:book).permit(:title, :author, :self_link, :preview_link)
    end

end
