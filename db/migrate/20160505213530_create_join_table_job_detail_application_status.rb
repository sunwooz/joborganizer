class CreateJoinTableJobDetailApplicationStatus < ActiveRecord::Migration
  def change
    create_table :job_details_application_statuses do |t|
      t.integer :job_detail_id
      t.integer :application_status_id
    end
  end
end
