class MainResponse {
  int? temp;
  int? feelsLike;
  int? tempMin;
  int? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;
  double? tempKf;

  MainResponse(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
    this.tempKf,
  );

  factory MainResponse.fromJson(Map<String, dynamic> json) {
    return MainResponse(
      (json['temp'] as num).toInt(),
      (json['feels_like'] as num).toInt(),
      (json['temp_min'] as num).toInt(),
      (json['temp_max'] as num).toInt(),
      json['pressure'] as int,
      json['humidity'] as int,
      json['sea_level'] as int?,
      json['grnd_level'] as int?,
      json['temp_kf'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    data['temp_kf'] = tempKf;
    return data;
  }
}
