class CreateAssigns < ActiveRecord::Migration
  def change
    create_table :assigns do |t|
      t.integer :user_id
      t.integer :issue_id
      t.timestamps null: false
    end
  end
end
