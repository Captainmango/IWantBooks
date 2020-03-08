class Book < ApplicationRecord
    has_many :lists
    has_many :users, through: :lists

    validates :title, presence: true
    validates :self_link, presence: true
    validates :author, presence: true
    validates :preview_link, presence: true


#     "selfLink": "https://www.googleapis.com/books/v1/volumes/yHZhswEACAAJ",
#    "volumeInfo": {
#     "title": "Health, Safety and Environment Test",
#     "subtitle": "For Operatives and Specialists",
#     "authors": [
#      "Construction Industry Training Board (2013- )"

# imageLinks": {
#      "smallThumbnail": "http://books.google.com/books/content?id=yHZhswEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
#      "thumbnail": "http://books.google.com/books/content?id=yHZhswEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"

# "previewLink": "http://books.google.co.uk/books?id=yHZhswEACAAJ&dq=test&hl=&cd=1&source=gbs_api",

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
