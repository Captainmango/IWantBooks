class SearchController < ApplicationController
    def results
        if current_user
            search_results = Book.search_books(params["search"]["query"])
            @books = search_results["items"]
        else
            flash[:notice] = "Please sign up or sign in to search for books"
            redirect_to "/"
        end
        
    end
end
