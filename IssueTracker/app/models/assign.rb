class Assign < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue
end
