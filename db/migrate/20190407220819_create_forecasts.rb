class CreateForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :forecasts do |t|
      t.datetime :date
      t.integer :max_temperature
      t.integer :min_temperature
      t.string :wind_direction
      t.integer :wind_speed
      t.integer :cloud_cover

      t.timestamps
    end
  end
end
