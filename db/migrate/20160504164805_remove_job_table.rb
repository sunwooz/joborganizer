class RemoveJobTable < ActiveRecord::Migration
  def change
    drop_table :jobs
  end
end
