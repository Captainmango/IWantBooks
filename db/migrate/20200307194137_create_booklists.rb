class CreateBooklists < ActiveRecord::Migration[5.2]
  def change
    create_table :booklists do |t|
      t.integer :book_id
      t.integer :list_id
    end
  end
end
