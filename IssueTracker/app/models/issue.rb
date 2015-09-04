class Issue < ActiveRecord::Base
  belongs_to :project
  has_many :comments
  has_many :votes

  has_one :assign
  has_many :tags
end
