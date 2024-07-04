class CoordResponse {
  num? lon;
  num? lat;

  CoordResponse(
    this.lon,
    this.lat,
  );

  factory CoordResponse.fromJson(Map<String, dynamic> json) {
    return CoordResponse(
      json['lon'] as num,
      json['lat'] as num,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}
