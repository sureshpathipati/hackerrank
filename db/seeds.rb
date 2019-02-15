# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.destroy_all
locations_data = [{state: "karnataka", city: "bangalore", latitude: "24.01010", longitude: "10.105"},
								  {state: "andhra", city: "hyderabad", latitude: "45.5660", longitude: "-55.555"},
									{state: "tamilnadu", city: "chennai", latitude: "109.1110", longitude: "34.555"},
									{state: "kerala", city: "ooty", latitude: "124.2340", longitude: "-234.987"},
									{state: "orissa", city: "ooooo", latitude: "387.00", longitude: "-98.0099"},
									{state: "gujarat", city: "gggggg", latitude: "3455.01010", longitude: "-700.555"}]
locations_data.each do |_location|
	Location.create(_location)
end

Weather.destroy_all
weather_data = [{w_day: DateTime.now-2.day, temperature: [*(1..24)].map{ rand(100) } },
								{w_day: DateTime.now-1.day, temperature: [*(1..24)].map{ rand(100) } },
								{w_day: DateTime.now, temperature: [*(1..24)].map{ rand(100) } },
								{w_day: DateTime.now+1.day, temperature: [*(1..24)].map{ rand(100) } },
								{w_day: DateTime.now+2.day, temperature: [*(1..24)].map{ rand(100) } },
								{w_day: DateTime.now+3.day, temperature: [*(1..24)].map{ rand(100) } }
								]

weather_data.each do |_weather|
	Location.all.each do |_location|
		weather = Weather.create(_weather)
		weather.location = _location
		weather.save
	end
end