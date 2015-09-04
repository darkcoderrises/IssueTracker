class Project < ActiveRecord::Base
  belongs_to :user
  
  has_many :issues
  has_many :working
  has_many :invite
end
