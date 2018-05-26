class RemoveAttributesFromAmenities < ActiveRecord::Migration[5.2]
  def change
    remove_column :amenities, :offsite_meeting, :string
    remove_column :amenities, :workshop, :string
    remove_column :amenities, :photo_shoot, :string
    remove_column :amenities, :film_shoot, :string
    remove_column :amenities, :corporate_event, :string
    remove_column :amenities, :office_party, :string
    remove_column :amenities, :product_launch, :string
  end
end
