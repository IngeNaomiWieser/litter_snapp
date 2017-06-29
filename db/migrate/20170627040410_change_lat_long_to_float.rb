class ChangeLatLongToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :locations, :latitude, 'float USING CAST(latitude AS float)'
    change_column :locations, :longitude, 'float USING CAST(longitude AS float)'
    change_column :locations, :radius, 'float USING CAST(radius AS float)'
  end
end
