class WindResponse {
  num? speed;
  int? deg;
  num? gust;

  WindResponse(
    this.speed,
    this.deg,
    this.gust,
  );

  factory WindResponse.fromJson(Map<String, dynamic> json) {
    return WindResponse(
      json['speed'] as num?,
      json['deg'] as int,
      json['gust'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}
