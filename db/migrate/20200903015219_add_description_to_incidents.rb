class AddDescriptionToIncidents < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :description, :text
  end
end
