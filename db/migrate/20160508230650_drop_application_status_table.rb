class DropApplicationStatusTable < ActiveRecord::Migration
  def change
    drop_table :application_statuses
  end
end
