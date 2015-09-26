class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :default
      t.references :post, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :categories, :default
  end
end
