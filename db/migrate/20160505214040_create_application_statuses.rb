class CreateApplicationStatuses < ActiveRecord::Migration
  def change
    create_table :application_statuses do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
