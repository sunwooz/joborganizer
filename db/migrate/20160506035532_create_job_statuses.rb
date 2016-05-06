class CreateJobStatuses < ActiveRecord::Migration
  def change
    create_table :job_statuses do |t|
      t.integer :job_detail_id
      t.integer :application_status_id
      t.timestamps null: false
    end
  end
end
