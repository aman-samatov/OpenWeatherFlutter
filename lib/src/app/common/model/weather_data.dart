import 'package:open_weather/src/app/common/core/model/base_data.dart';

class WeatherData implements BaseData {
  final String description;
  final String temp;
  final String tempMin;
  final String tempMax;
  final String pressure;
  final String humidity;
  final String dt;
  final String name;
  final String weatherStateIcon;

  WeatherData(
    this.dt,
    this.name,
    this.description,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.weatherStateIcon,
  );
}
