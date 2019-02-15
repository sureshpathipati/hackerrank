class AddLocationRefToWeather < ActiveRecord::Migration
  def change
    add_reference :weathers, :location, foreign_key: true
  end
end
