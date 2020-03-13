class SearchController < ApplicationController
    def results
        search_results = Book.search_books(params["search[query]"])
        @books = search_results["items"]
    end
end
