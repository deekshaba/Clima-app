import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'ea5f7ed737b6509d9b6df31ebabc6162';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(var condition) {
    if (condition < 300.0) {
      return '🌩';
    } else if (condition < 400.0) {
      return '🌧';
    } else if (condition < 600.0) {
      return '☔️';
    } else if (condition < 700.0) {
      return '☃️';
    } else if (condition < 800.0) {
      return '🌫';
    } else if (condition == 800.0) {
      return '☀️';
    } else if (condition <= 804.0) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(var temp) {
    if (temp > 25.0) {
      return 'It\'s 🍦 time';
    } else if (temp > 20.0) {
      return 'Time for shorts and 👕';
    } else if (temp < 10.0) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
