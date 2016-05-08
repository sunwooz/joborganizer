class DropJobStatusTable < ActiveRecord::Migration
  def change
    drop_table :job_statuses
  end
end
