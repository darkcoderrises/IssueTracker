class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
      t.integer :issue_id
      t.timestamps null: false
    end
  end
end
