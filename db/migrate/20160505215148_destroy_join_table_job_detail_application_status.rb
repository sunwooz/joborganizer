class DestroyJoinTableJobDetailApplicationStatus < ActiveRecord::Migration
  def change
    drop_table :job_details_application_statuses
  end
end
