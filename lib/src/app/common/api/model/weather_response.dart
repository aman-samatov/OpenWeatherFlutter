class WeatherResponse {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherResponse(
    this.id,
    this.main,
    this.description,
    this.icon,
  );

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      json['id'] as int,
      json['main'] as String,
      json['description'] as String,
      json['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}
