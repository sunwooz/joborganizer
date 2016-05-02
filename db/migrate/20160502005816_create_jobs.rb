class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to(:user)
      t.string :jobkey
      t.timestamps null: false
    end
  end
end
