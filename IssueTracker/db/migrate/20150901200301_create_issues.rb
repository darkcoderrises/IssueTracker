class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :heading
      t.string :description
      t.string :status
      t.boolean :open
      
      t.integer :project_id
      t.timestamps null: false
    end
  end
end
