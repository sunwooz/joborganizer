class DestroyJoinTableApplicationStatusJobDetail < ActiveRecord::Migration
  def change
    drop_table :application_statuses_job_details
  end
end
