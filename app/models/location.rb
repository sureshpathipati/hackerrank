class Location < ActiveRecord::Base
  has_many :weathers

  scope :lat_lon, ->(lat, lon){ where(latitude: lat, longitude: lon) }

  def location_details
    {
      "lat" => latitude,
      "lon" => longitude,
      "city" => city,
      "state" => state
    }
  end

  def self.ids_of_weather_with_lat_lon(lat, lon)
    where(latitude: lat, longitude: lon).joins(:weathers).pluck("weathers.id") 
  end

end


