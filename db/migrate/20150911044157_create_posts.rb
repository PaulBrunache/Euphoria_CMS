class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :featured_img 
      t.string :title
      t.text :content
      t.string :status
      t.timestamps null: false
    end
  end
end
