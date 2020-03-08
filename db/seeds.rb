# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(:username => "edward", :password => "test", :first_name => "Edward", :last_name => "Heaver")
user_1.save
user_2 = User.create(:username => "alice", :password => "test", :first_name => "Alice", :last_name => "Smithers")
user_2.save
user_3 = User.create(:username => "reggie", :password => "test", :first_name => "Reggie", :last_name => "Yates")
user_3.save

books = Book.search_books("Ruby")
books["items"].each do |book|
    new_book = user_1.books.create(:self_link => book["selfLink"],
        :title => book["volumeInfo"]["title"], 
        :author => book["volumeInfo"]["authors"], 
        :preview_link => book["volumeInfo"]["previewLink"])
        new_book.save
end

