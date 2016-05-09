class AddTitleToJobDetails < ActiveRecord::Migration
  def change
    add_column :job_details, :title, :string
  end
end
