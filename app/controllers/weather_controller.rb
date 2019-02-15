class WeatherController < ApplicationController
  respond_to :json

  skip_before_action :verify_authenticity_token

  def erase
    @weathers = if limited_erase?
      weathers = Weather.between_dates(params['start'], params['end'])
      weathers.joins(:location).merge(Location.lat_lon(params['lat'], params['lon']))
    else
      Weather.all
    end
    @weathers.delete_all
    render json: :ok
  end

  def create
    status = 201
    if Weather.id_exists?(params['id'])
      status = 400
    else
      location = Location.find(location_params)
      location.weathers.create(weather_params)
    end
    render json: {status: status}
  end


  def index
    @weather = if params.has_key? 'date'
        Weather.where(w_day: params['date'])
      elsif (params.has_key? 'lat') && (params.has_key? 'lon')
        ids = Location.ids_of_weather_with_lat_lon(params['lat'], params['lon'])
        weathers = Weather.where(id: ids)
        render json: {status: 404} and return unless weathers.any?
        weathers
      else
        Weather.all
      end
    @weather = @weather.order('id ASC')
    details = @weather.includes(:location).map(&:weather_details)
    render json: {status: :ok, data: details}
  end

  private

  def weather_params
    params.permit('id', 'date', 'temperature')
  end

  def location_params
    params.require('location').permit('lat', 'lon', 'city', 'state')
  end

  def limited_erase?
    (params.has_key? 'start') && (params.has_key? 'end') && (params.has_key? 'lat') && (params.has_key? 'lon')
  end
end



