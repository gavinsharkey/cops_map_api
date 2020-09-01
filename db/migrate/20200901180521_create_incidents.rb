class CreateIncidents < ActiveRecord::Migration[6.0]
  def change
    create_table :incidents do |t|
      t.string :title
      t.float :latitude
      t.float :longitude
      t.integer :flags

      t.timestamps
    end
  end
end
