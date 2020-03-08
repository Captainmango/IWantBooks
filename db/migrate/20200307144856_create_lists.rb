class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
