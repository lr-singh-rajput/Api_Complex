import 'Geo.dart';

class Address {
  Address({
      this.street, 
      this.suite, 
      this.city, 
      this.zipcode, 
      this.geo,});

  Address.fromJson(dynamic json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;
Address copyWith({  String? street,
  String? suite,
  String? city,
  String? zipcode,
  Geo? geo,
}) => Address(  street: street ?? this.street,
  suite: suite ?? this.suite,
  city: city ?? this.city,
  zipcode: zipcode ?? this.zipcode,
  geo: geo ?? this.geo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['suite'] = suite;
    map['city'] = city;
    map['zipcode'] = zipcode;
    if (geo != null) {
      map['geo'] = geo?.toJson();
    }
    return map;
  }

}