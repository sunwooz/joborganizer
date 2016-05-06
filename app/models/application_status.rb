class ApplicationStatus < ActiveRecord::Base
  has_many :job_statuses
  has_many :job_details, through: :job_statuses
end
