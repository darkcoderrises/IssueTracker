class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :issue_id
      t.timestamps null: false
    end
  end
end
