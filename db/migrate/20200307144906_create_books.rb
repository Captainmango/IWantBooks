class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      
      t.string :self_link
      t.string :title
      t.string :author, :default => "Author Unknown"
      t.string :preview_link
      t.belongs_to :user
      

      t.timestamps
    end
  end
end
