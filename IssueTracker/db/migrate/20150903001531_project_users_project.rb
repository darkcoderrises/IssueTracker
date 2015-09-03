class ProjectUsersProject < ActiveRecord::Migration
  def change
    create_table :project_users_projects, id: false do |t|
      t.belongs_to :projects_user, index: true
      t.belongs_to :project, index: true
    end
  end
end
