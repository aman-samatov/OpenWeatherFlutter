class SysResponse {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  SysResponse(
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  );

  factory SysResponse.fromJson(Map<String, dynamic> json) {
    return SysResponse(
      json['type'] as int?,
      json['id'] as int?,
      json['country'] as String,
      json['sunrise'] as int,
      json['sunset'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
