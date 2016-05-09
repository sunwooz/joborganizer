class AddNotesToJobDetail < ActiveRecord::Migration
  def change
    add_column :job_details, :note, :text
  end
end
