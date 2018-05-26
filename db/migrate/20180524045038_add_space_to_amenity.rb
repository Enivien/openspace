class AddSpaceToAmenity < ActiveRecord::Migration[5.2]
  def change
    add_reference :amenities, :space, index: true
  end
end
