class CreateCoverLetters < ActiveRecord::Migration
  def change
    create_table :cover_letters do |t|
      t.belongs_to(:job)
      t.text :letter
      t.timestamps null: false
    end
  end
end
