class Job < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :jobkey
end
