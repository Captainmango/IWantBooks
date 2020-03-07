class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :self_link
      t.string :title
      t.string :author
      t.string :preview_link
      t.integer :user_id

      t.timestamps
    end
  end
end
