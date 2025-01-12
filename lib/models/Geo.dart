class Geo {
  Geo({
      this.lat, 
      this.lng,});

  Geo.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  String? lat;
  String? lng;
Geo copyWith({  String? lat,
  String? lng,
}) => Geo(  lat: lat ?? this.lat,
  lng: lng ?? this.lng,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}