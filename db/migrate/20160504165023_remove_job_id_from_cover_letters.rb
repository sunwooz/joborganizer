class RemoveJobIdFromCoverLetters < ActiveRecord::Migration
  def change
    remove_column :cover_letters, :job_id
  end
end
