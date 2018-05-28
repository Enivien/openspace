class AddSpaceReferencesToActivities < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :space, foreign_key: true
  end
end
