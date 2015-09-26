class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :name
      t.text :content
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
