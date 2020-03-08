class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.string :name, :null => false, :default => "My Library"
      t.string :desc, :null => false, :default => "This is my library."

      t.timestamps
    end
  end
end
