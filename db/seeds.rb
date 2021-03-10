# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

new1 = User.create(:email => "edward@example.com", :password => "edward21", :admin => true)
new1.save
user_2 = User.create(:email => "alice@example.com", :password => "alice221")
user_2.save
user_3 = User.create(:email => "reggie@example.com", :password => "reggie32")
user_3.save

user_1 = User.find(1)

books = Book.search_books("Ruby")
books["items"].each do |book|
    new_book = user_1.books.create(
        :self_link => book["selfLink"],
        :title => book["volumeInfo"]["title"], 
        :author => book["volumeInfo"]["authors"].to_a[0], 
        :preview_link => book["volumeInfo"]["previewLink"])
        new_book.save

end

# user_1.books.each do |book|
#     19.times do
#         comment = book.comments.create(content: Faker::Quote.yoda, user_id: user_1.id, book_id: book.id)
#         comment.save
#         byebug

#     end
# end


