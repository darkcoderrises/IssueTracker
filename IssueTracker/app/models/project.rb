class Project < ActiveRecord::Base
  belongs_to :project_owner
  has_and_belongs_to_many :project_users

  has_many :issues
end
