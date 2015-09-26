class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :description
      t.text :keywords
      t.boolean :index
      t.boolean :follow

      t.timestamps null: false
    end
  end
end
