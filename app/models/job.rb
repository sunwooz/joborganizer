class Job < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :jobkey, if: :job_not_saved_for_user

  private

    def job_not_saved_for_user
      self.user.jobs.pluck(:jobkey).include?(self.jobkey)
    end
end
