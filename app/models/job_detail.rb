class JobDetail < ActiveRecord::Base
  # validates_uniqueness_of :jobkey, if: :jobkey_is_unique_to_user
  belongs_to :user
  
  private

  def jobkey_is_unique_to_user
    self.user.job_details.pluck(:jobkey).include?(self.jobkey)
  end
end
