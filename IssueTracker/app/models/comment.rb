class Comment < ActiveRecord::Base
  belongs_to :issue
  has_many :mentions
end
