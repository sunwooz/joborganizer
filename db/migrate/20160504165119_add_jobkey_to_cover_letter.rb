class AddJobkeyToCoverLetter < ActiveRecord::Migration
  def change
    add_column :cover_letters, :jobkey, :string
  end
end
