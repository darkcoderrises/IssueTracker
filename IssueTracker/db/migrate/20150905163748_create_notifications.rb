class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notify
      t.string :link
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
