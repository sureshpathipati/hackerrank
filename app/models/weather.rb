class Weather < ActiveRecord::Base
  belongs_to :location

  scope :between_dates, ->(start_date, end_date) { where(:w_day => start_date.to_date.beginning_of_day..end_date.to_date.end_of_day)}
  scope :by_date, ->(date) {where(w_day: date) }

  def weather_details
    {
      "id" => id,
      "date" => w_day.to_date.strftime("%Y-%M-%d"),
      "location" => location.location_details,
      "temperature" => temperature
    }
  end

  def self.id_exists?(id)
    exists?(id: id)
  end

end