class JobStatus < ActiveRecord::Base
  belongs_to :job_detail
  belongs_to :application_status
end
