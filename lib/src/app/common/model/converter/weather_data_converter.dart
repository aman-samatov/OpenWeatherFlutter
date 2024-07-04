import 'package:open_weather/res/drawable.dart';
import 'package:open_weather/src/app/common/api/model/weather_data_response.dart';
import 'package:open_weather/src/app/common/core/converter/base_data_converter.dart';
import 'package:open_weather/src/app/common/core/model/base_data.dart';
import 'package:open_weather/src/app/common/model/error_data.dart';
import 'package:open_weather/src/app/common/model/weather_data.dart';
import 'package:open_weather/src/app/common/model/weather_enum.dart';
import 'package:open_weather/src/app/common/util/constants.dart';
import 'package:open_weather/src/app/common/util/extensions.dart';

class WeatherDataConverter
    implements BaseDataConverter<WeatherDataResponse, BaseData> {
  @override
  BaseData convert(BaseData response) {
    BaseData data = ErrorData();
    if (response is WeatherDataResponse) {
      data = WeatherData(
          response.dt.toString(),
          response.name.toString(),
          response.weather![0].description.toString().capitalize(),
          '${response.main!.temp} °C',
          '${response.main!.tempMin} °C',
          '${response.main!.tempMax} °C',
          response.main!.pressure.toString(),
          response.main!.humidity.toString(),
          getIconPath(response.weather![0].id,
              int.parse(response.dt.toString().substring(0, 2))));
    }
    return data;
  }

  String getIconPath(int? weatherState, int time) {
    bool isDay = time > Constants.startOfTheDay && time < Constants.endOfTheDay;
    switch (WeatherState.values
        .firstWhere((state) => weatherState == state.weatherState)) {
      case WeatherState.clearSky:
        return isDay ? Drawables.dayIcClearSky : Drawables.nightIcClearSky;
      case WeatherState.fewClouds:
        return isDay ? Drawables.dayIcFewClouds : Drawables.nightIcFewClouds;
      case WeatherState.scatteredClouds || WeatherState.brokenClouds:
        return isDay
            ? Drawables.dayIcBrokenClouds
            : Drawables.nightIcBrokenClouds;
      case WeatherState.overcastClouds:
        return isDay
            ? Drawables.dayIcOvercastClouds
            : Drawables.nightIcOvercastClouds;
      case WeatherState.lightIntensityRain ||
            WeatherState.lightRain ||
            WeatherState.lightIntensityDrizzleRain ||
            WeatherState.lightIntensityShowerRain:
        return isDay ? Drawables.dayIcLightRain : Drawables.nightIcLightRain;
      case WeatherState.moderateRain ||
            WeatherState.heavyIntensityRain ||
            WeatherState.veryHeavyRain ||
            WeatherState.extremeRain ||
            WeatherState.showerRain ||
            WeatherState.raggedShowerRain ||
            WeatherState.heavyIntensityShowerRain ||
            WeatherState.heavyIntensityDrizzleRain ||
            WeatherState.showerRainAndDrizzle ||
            WeatherState.heavyShowerRainAndDrizzle ||
            WeatherState.showerDrizzle:
        return isDay ? Drawables.dayIcHeavyRain : Drawables.dayIcHeavyRain;
      case WeatherState.freezingRain ||
            WeatherState.lightRainAndSnow ||
            WeatherState.rainAndSnow ||
            WeatherState.showerSnow ||
            WeatherState.heavyShowerSnow:
        return isDay
            ? Drawables.dayIcSnowAndRain
            : Drawables.nightIcSnowAndRain;
      case WeatherState.thunderstormWithLightRain ||
            WeatherState.thunderstormWithRain ||
            WeatherState.thunderstormWithHeavyRain ||
            WeatherState.lightThunderstorm ||
            WeatherState.thunderstorm ||
            WeatherState.heavyThunderstorm ||
            WeatherState.raggedThunderstorm ||
            WeatherState.thunderstormWithLightDrizzle ||
            WeatherState.thunderstormWithDrizzle ||
            WeatherState.thunderstormWithHeavyDrizzle:
        return isDay
            ? Drawables.dayIcThunderstorm
            : Drawables.nightIcThunderstorm;
      case WeatherState.lightShowerSnow ||
            WeatherState.lightSnow ||
            WeatherState.snow ||
            WeatherState.heavySnow ||
            WeatherState.sleet ||
            WeatherState.lightShowerSleet ||
            WeatherState.showerSleet:
        return isDay ? Drawables.dayIcSnow : Drawables.nightIcSnow;
      case WeatherState.mist ||
            WeatherState.smoke ||
            WeatherState.haze ||
            WeatherState.fog:
        return Drawables.dayIcMist;
      case WeatherState.lightIntensityDrizzle ||
            WeatherState.drizzle ||
            WeatherState.heavyIntensityDrizzle ||
            WeatherState.lightIntensityDrizzleRain ||
            WeatherState.drizzleRain:
        return isDay ? Drawables.dayIcDrizzle : Drawables.nightIcDrizzle;
      case WeatherState.dust ||
            WeatherState.dustSand ||
            WeatherState.sand ||
            WeatherState.squall:
        return isDay ? Drawables.dayIcSquall : Drawables.nightIcSquall;
      default:
        return isDay ? Drawables.dayIcClearSky : Drawables.nightIcClearSky;
    }
  }
}
