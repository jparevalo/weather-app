class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :cities, :locationKey, :location_key
  end
end
