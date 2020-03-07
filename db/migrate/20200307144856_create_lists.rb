class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :name
      t.integer :description

      t.timestamps
    end
  end
end
