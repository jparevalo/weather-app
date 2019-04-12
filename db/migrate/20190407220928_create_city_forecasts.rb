class CreateCityForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :city_forecasts do |t|
      t.references :city, foreign_key: true
      t.references :day_1, foreign_key: false
      t.references :day_2, foreign_key: false
      t.references :day_3, foreign_key: false
      t.references :day_4, foreign_key: false
      t.references :day_5, foreign_key: false

      t.timestamps
    end
  end
end
