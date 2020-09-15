class RemoveTitleFromIncidents < ActiveRecord::Migration[6.0]
  def change
    remove_column :incidents, :title
  end
end
