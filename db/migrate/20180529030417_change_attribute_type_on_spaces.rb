class ChangeAttributeTypeOnSpaces < ActiveRecord::Migration[5.2]
  def change
    rename_column :spaces, :picture, :pictures
  end
end
