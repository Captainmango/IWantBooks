class Book < ApplicationRecord
    has_many :users
    has_many :users, through: :lists


    def self.search_books(query_string, author="", title="") 
        url = "https://www.googleapis.com/books/v1/volumes?q=#{query_string.to_s}+inauthor:#{author.to_s}+intitle:#{title.to_s}&key=#{ENV["API_KEY"]}"

        response = HTTParty.get(url)
        results = response.parsed_response
        results
    end

    def self.get_book(self_link)
       response = HTTParty.get(self_link)
       result = response.parsed_response
       result
    end

end
