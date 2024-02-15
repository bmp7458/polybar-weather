#!/bin/bash

api_key="" # openweathermap.org api key
city="" # city of choice 
units="metric" # options: metric, imperial

icon_color="%{F#d4a067}" # yellow-orange, gold-ish; moderate orange
text_color="%{F#eeffff}" # white

weather_data=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$city&units=$units&appid=$api_key")

weather_icon="" # <- leave blank.
weather_description="" # <----/

if [[ "$(echo "$weather_data" | jq -r '.cod')" == "200" ]]; then
    temp=$(echo "$weather_data" | jq -r '.main.temp')
    weather_icon_code=$(echo "$weather_data" | jq -r '.weather[0].icon')
    weather_description=$(echo "$weather_data" | jq -r '.weather[0].description' )

    # using Nerd Fonts Glyphs, adjust weather_icon to your desires
    case $weather_icon_code in
        "01d") weather_icon="";;  # clear sky day
        "01n") weather_icon="";;  # clear sky night
        "02d") weather_icon="";;  # few clouds day
        "02n") weather_icon="";;  # few clouds night
        "03d"|"03n") weather_icon="";;  # scattered clouds
        "04d"|"04n") weather_icon="";;  # broken clouds
        "09d"|"09n") weather_icon="";;  # shower rain
        "10d"|"10n") weather_icon="";;  # rain
        "11d"|"11n") weather_icon="";;  # thunderstorm
        "13d"|"13n") weather_icon="";;  # snow
        "50d"|"50n") weather_icon="";;  # mist
    esac
fi

echo "$icon_color$weather_icon $text_color$weather_description  $temp°C" # use °F if you are using imperial in line 5
