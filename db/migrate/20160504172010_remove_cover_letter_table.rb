class RemoveCoverLetterTable < ActiveRecord::Migration
  def change
    drop_table :cover_letters
  end
end
