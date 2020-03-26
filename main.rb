#! /usr/bin/env ruby
require "accuweather"


def get_city(city_name)
    location_array = Accuweather.city_search(name: "#{city_name}")
    city = location_array.first
end

def get_weather_forcast(city_name)

    city = get_city(city_name)
    weather_forecast = Accuweather.get_conditions(location_id: city.id).forecast
    # last_forecast_day = weather_forecast.last
    # last_forecast_day.date        # => "12/3/2015"
    # last_forecast_day.day_of_week # => "Thursday"
    # last_forecast_day.sunrise     # => "7:49 AM"
    # last_forecast_day.sunset      # => "4:16 PM"
    first_forecast_day = weather_forecast.first
    puts "Today is #{first_forecast_day.date}."
    puts "The daytime forecast: #{first_forecast_day.daytime.weather_text_long}."
    # puts first_forecast_day.daytime.weather_icon
    puts "Max temp is: #{first_forecast_day.daytime.high_temperature} degree."
    puts "Min temp is #{first_forecast_day.daytime.low_temperature} degree."
    puts "The nighttime forecast: #{first_forecast_day.nighttime.weather_text_long}."
    puts "Sunrise is #{first_forecast_day.sunrise}."
    puts "Sunset is #{first_forecast_day.sunset}."
end

get_weather_forcast("Sydney")
    

