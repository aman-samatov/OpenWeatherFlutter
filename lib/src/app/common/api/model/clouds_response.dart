class CloudsResponse {
  int? all;

  CloudsResponse(this.all);

  factory CloudsResponse.fromJson(Map<String, dynamic> json) {
    return CloudsResponse(
        json['all'] as int
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}
