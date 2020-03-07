class Book < ApplicationRecord




    def search_books(query_string, author="", title="", subject="", isbn="")
      url = "https://www.googleapis.com/books/v1/volumes?q=#{query_string}+inauthor:#{author}+intitle:#{title}"


end
