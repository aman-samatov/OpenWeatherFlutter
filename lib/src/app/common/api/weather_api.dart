import 'dart:convert';
import 'dart:developer';

import 'package:open_weather/src/app/common/core/model/base_data.dart';
import 'package:open_weather/src/app/common/model/error_data.dart';
import 'package:open_weather/src/app/common/util/constants.dart';
import 'model/weather_data_response.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<BaseData> getWeatherDataByCityName(
      {required String cityName}) async {
    var queryParams = {
      'appid': Constants.appidKey,
      'q': cityName.trim(),
      'units': Constants.unitsSystem,
      'lang': Constants.ruLang,
    };
    var url =
        Uri.https(Constants.baseUrlDomain, Constants.weatherPath, queryParams);
    log("request++: ${url.toString()}");
    var response = await http.get(url);
    switch (response.statusCode) {
      case Constants.successfulCode:
        return WeatherDataResponse.fromJson(
            json.decode(response.body) as Map<String, dynamic>);
      case Constants.cityNotFoundCode:
        return ErrorData();
      default:
        throw Exception();
    }
  }
}
