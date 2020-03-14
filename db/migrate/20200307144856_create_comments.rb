class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.string :content, :null => false, :default => "Added to library"

      t.timestamps
    end
  end
end

