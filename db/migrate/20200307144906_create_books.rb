class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      
      t.string :self_link
      t.string :title
      t.string :author, :default => "Author Unknown"
      t.string :preview_link
      t.string :thumbnail
      

      t.timestamps
    end
  end
end
