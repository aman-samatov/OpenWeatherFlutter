import 'dart:developer';

import 'package:open_weather/src/app/common/core/model/base_data.dart';
import 'package:open_weather/src/app/common/model/converter/weather_data_converter.dart';

import '../api/weather_api.dart';

class Repo {
  Future<BaseData> getWeatherDataByCityName(String cityName) {
    return WeatherApi()
        .getWeatherDataByCityName(cityName: cityName)
        .then((response) {
      return WeatherDataConverter().convert(response);
    });
  }
}
