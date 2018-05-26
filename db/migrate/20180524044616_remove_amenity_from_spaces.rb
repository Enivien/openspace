class RemoveAmenityFromSpaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :spaces, :amenity_id
  end
end
