class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :project_id
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
