class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.boolean :create
      t.boolean :manage
      t.boolean :delete
      t.boolean :manage_others
      t.boolean :delete_others

      t.timestamps null: false
    end
  end
end
