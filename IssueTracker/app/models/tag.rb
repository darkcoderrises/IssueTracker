class Tag < ActiveRecord::Base
  has_many :issues
end
