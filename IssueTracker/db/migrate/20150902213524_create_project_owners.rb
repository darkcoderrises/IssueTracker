class CreateProjectOwners < ActiveRecord::Migration
  def change
    create_table :project_owners do |t|

      t.timestamps null: false
    end
  end
end
