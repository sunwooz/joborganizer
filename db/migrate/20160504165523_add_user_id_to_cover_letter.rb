class AddUserIdToCoverLetter < ActiveRecord::Migration
  def change
    add_column :cover_letters, :user_id, :integer
  end
end
