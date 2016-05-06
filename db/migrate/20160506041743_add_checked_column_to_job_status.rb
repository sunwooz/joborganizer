class AddCheckedColumnToJobStatus < ActiveRecord::Migration
  def change
    add_column :job_statuses, :checked, :boolean
  end
end
