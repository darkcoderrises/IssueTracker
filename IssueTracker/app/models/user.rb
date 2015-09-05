class User < ActiveRecord::Base
  has_secure_password

  has_many :projects
  has_many :invite
  has_many :working

  has_many :mentions
  has_many :votes

  has_many :assigns
  has_many :notifications
end
