class CreateJobDetails < ActiveRecord::Migration
  def change
    create_table :job_details do |t|
      t.text :cover_letter
      t.string :jobkey
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
