class ProjectsUser < User
  has_and_belongs_to_many :projects
end
