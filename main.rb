#! /usr/bin/env ruby
require 'accuweather'
require 'tty-prompt'
require 'kovid'
require 'terminal-table'
# require_relative 'hack_table'

def get_city(city_name)
    location_array = Accuweather.city_search(name: "#{city_name}")
    city = location_array.first
end

def get_weather_forcast(city_name)

    city = get_city(city_name)
    weather_forecast = Accuweather.get_conditions(location_id: city.id, metric: true).forecast
    day_1 = weather_forecast[0]
    day_2 = weather_forecast[1]
    day_3 = weather_forecast[2]

    result = [
        "first_day" [day_1.daytime.weather_text_long, day_1.daytime.high_temperature, day_1.daytime.low_temperature],
        first_night:  [day_1.nighttime.weather_text_long, day_1.nighttime.high_temperature, day_1.nighttime.low_temperature],
        second_day: [day_2.daytime.weather_text_long, day_2.daytime.high_temperature, day_2.daytime.low_temperature],
        second_night: [day_2.nighttime.weather_text_long, day_2.nighttime.high_temperature, day_2.nighttime.low_temperature],
        last_day: [day_3.daytime.weather_text_long, day_3.daytime.high_temperature, day_3.daytime.low_temperature],
    last_night: [day_3.nighttime.weather_text_long, day_3.nighttime.high_temperature, day_3.nighttime.low_temperature]
    ]
    return result
end


def get_forecast_table()
    result = get_weather_forcast("Sydney")
    puts result[:first_day]
    rows = []
    table = Terminal::Table.new :title => "Sydney",:headings => ['Day/Night', 'Weather', 'Min temp', 'Max temp'], :rows => rows do |t|
        t << ['Day 1', result[first_day[0]], nil, nil]
        t << :separator
        t.add_row ['Night 1', nil, nil, nil]
        t.add_separator
        t.add_row ['Day 2', nil, nil, nil]
        t.add_separator
        t.add_row ['Night 2', nil, nil, nil]
        t.add_separator
        t.add_row ['Day 3', nil, nil, nil]
        t.add_separator
        t.add_row ['Night 2', nil, nil, nil]
    end
    
end

puts get_forecast_table

# def start()
# prompt = TTY::Prompt.new
# start_choice = prompt.select("What would you like to do", %w(CovidStatsAus Current Forecast))
#     if start_choice == "CovidStatsAus"
#        return system("kovid check Australia")
#     elsif start_choice == "Current"
        
#     elsif start_choice == "Forecast"
#         get_weather_forcast("Sydney")
#     end
# end
# puts "Welcome to the Sydney isolation helper!"
# start()




    

