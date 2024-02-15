# polybar-weather
A simple Polybar module that displays weather information in a given city.

## Usage
To use `polybar-weather`, go into your polybar configuration file and add the following.
```ini
[module/weather]
type = custom/script
interval = 300
format = <label>
exec = PATH_TO_WEATHER.sh
format-background = ${color.background}
```
Replace `PATH_TO_WEATHER.sh` with the path to the file.<br>
Icon and text color and configurations can be found in `weather.sh`.

## Example
Below is an image of the module in action.<br>
![Example Image](https://github.com/bmp7458/polybar-weather/blob/main/preview.png)
