import 'package:flutter/material.dart';
import 'package:open_weather/res/colors.dart';
import 'package:open_weather/res/drawable.dart';
import 'package:open_weather/res/sizes.dart';
import 'package:open_weather/src/app/common/core/model/base_data.dart';
import 'package:open_weather/src/app/common/data/repo.dart';
import 'package:open_weather/src/app/common/model/weather_data.dart';
import 'package:open_weather/src/app/common/util/constants.dart';
import 'package:open_weather/uikit/error_card.dart';
import 'package:open_weather/uikit/hollow_button.dart';
import 'package:open_weather/uikit/info_container.dart';
import 'package:open_weather/uikit/progress_bar.dart';
import 'package:open_weather/uikit/search_bar.dart';
import 'package:open_weather/uikit/weather_info_container.dart';

class FirstApp extends StatefulWidget {
  const FirstApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WidgetState();
  }
}

class _WidgetState extends State<FirstApp> {
  bool isCityFound = true;
  String _cityName = '';
  String _temperature = '';
  String _maxTemp = '';
  String _minTemp = '';
  String _humidity = '';
  String _pressure = '';
  String _date = '';
  String _description = '';
  String _weatherStateIcon = '';
  late Future<BaseData> data;

  @override
  void initState() {
    super.initState();
    someFunc(Constants.defaultCity);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              children: [
                TopSearchBar(someFunc),
                FutureBuilder<BaseData>(
                    future: data,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return isCityFound
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  WeatherInfoContainer(
                                      cityName: _cityName,
                                      temperature: _temperature,
                                      weatherStateIcon: _weatherStateIcon,
                                      date: _date,
                                      description: _description),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InfoContainer(
                                        title: 'Макс. температура',
                                        value: _maxTemp,
                                        bottomGradientColor: AppColors
                                            .maxTempBottomGradientColor,
                                        borderColor: Colors.red,
                                        picturePath: Drawables.icMaxTemp,
                                        pictureColor: Colors.redAccent,
                                        horizontalMargin: AppSizes
                                            .infoContainerHorizontalMargin,
                                      ),
                                      InfoContainer(
                                        title: 'Мин. температура',
                                        value: _minTemp,
                                        bottomGradientColor: Colors.blueGrey,
                                        borderColor: Colors.blue,
                                        picturePath: Drawables.icMinTemp,
                                        pictureColor: Colors.lightBlueAccent,
                                        horizontalMargin: AppSizes
                                            .infoContainerHorizontalMargin,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InfoContainer(
                                        title: 'Влажность',
                                        value: _humidity,
                                        bottomGradientColor: Colors.green,
                                        borderColor: Colors.green,
                                        picturePath: Drawables.icHumidity,
                                        pictureColor: Colors.green,
                                        horizontalMargin: AppSizes
                                            .infoContainerHorizontalMargin,
                                        verticalMargin: AppSizes
                                            .infoContainerVerticalMargin,
                                      ),
                                      InfoContainer(
                                        title: 'Давление',
                                        value: _pressure,
                                        bottomGradientColor: Colors.black12,
                                        borderColor:
                                            AppColors.pressureBorderColor,
                                        picturePath: Drawables.icPressure,
                                        pictureColor: Colors.white,
                                        horizontalMargin: AppSizes
                                            .infoContainerHorizontalMargin,
                                        verticalMargin: AppSizes
                                            .infoContainerVerticalMargin,
                                      ),
                                    ],
                                  ),
                                  HollowButton(
                                      buttonTitle: 'Подробнее',
                                      onPressed: () {}),
                                ],
                              )
                            : const ErrorCard();
                      } else {
                        return const ProgressBar();
                      }
                    })
              ],
            ),
          ),
        ),
      );

  void someFunc(String cityName) {
    setState(() {
      data = Repo().getWeatherDataByCityName(cityName);
      data.then((weather) {
        if (weather is WeatherData) {
          isCityFound = true;
          _date = weather.dt;
          _cityName = weather.name;
          _description = weather.description;
          _temperature = weather.temp;
          _maxTemp = weather.tempMax;
          _minTemp = weather.tempMin;
          _humidity = weather.humidity;
          _pressure = weather.pressure;
          _weatherStateIcon = weather.weatherStateIcon;
        } else {
          isCityFound = false;
        }
      });
    });
  }
}
