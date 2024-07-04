import 'package:instant/instant.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/src/app/common/core/model/base_data.dart';
import 'package:open_weather/src/app/common/util/constants.dart';
import 'package:timezone/standalone.dart' as tz;

import 'clouds_response.dart';
import 'coord_response.dart';
import 'main_response.dart';
import 'sys_response.dart';
import 'weather_response.dart';
import 'wind_response.dart';

class WeatherDataResponse implements BaseData {
  CoordResponse? coord;
  List<WeatherResponse>? weather;
  String? base;
  MainResponse? main;
  int? visibility;
  WindResponse? wind;
  CloudsResponse? clouds;
  String? dt;
  SysResponse? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherDataResponse(
      this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod);

  factory WeatherDataResponse.fromJson(Map<String, dynamic> json) {
    final greenwich = tz.getLocation('UTC');
    final localizedDt = tz.TZDateTime.from(DateTime.now(), greenwich);

    return WeatherDataResponse(
        CoordResponse.fromJson(json['coord'] as Map<String, dynamic>),
        (json['weather'] as List<dynamic>)
            .map((dynamic value) =>
                WeatherResponse.fromJson(value as Map<String, dynamic>))
            .toList(),
        json['base'].toString(),
        MainResponse.fromJson(json['main'] as Map<String, dynamic>),
        json['visibility'] as int,
        WindResponse.fromJson(json['wind'] as Map<String, dynamic>),
        CloudsResponse.fromJson(json['clouds'] as Map<String, dynamic>),
        DateFormat.Hm().format(dateTimeToOffset(
          offset: (json['timezone'] as int) / Constants.secondsInHour,
          datetime: localizedDt,
        )),
        SysResponse.fromJson(json['sys'] as Map<String, dynamic>),
        json['timezone'] as int,
        json['id'] as int,
        json['name'] as String,
        json['cod'] as int);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coord'] = coord?.toJson();
    data['weather'] =
        weather?.map((weatherResponse) => weatherResponse.toJson()).toList();
    data['base'] = base;
    data['main'] = main?.toJson();
    data['visibility'] = visibility;
    data['wind'] = wind?.toJson();
    data['clouds'] = clouds?.toJson();
    data['dt'] = dt;
    data['sys'] = sys?.toJson();
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}
