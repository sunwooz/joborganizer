class AddCompanyToJobDetails < ActiveRecord::Migration
  def change
    add_column :job_details, :company, :string
  end
end
