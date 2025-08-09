import 'coordinates.dart';

class Address {
  String? address;
  String? city;
  String? state;
  String? stateCode;
  String? postalCode;
  Coordinates? coordinates;
  String? country;

  Address({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json['address'] as String?,
    city: json['city'] as String?,
    state: json['state'] as String?,
    stateCode: json['stateCode'] as String?,
    postalCode: json['postalCode'] as String?,
    coordinates: json['coordinates'] == null
        ? null
        : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    country: json['country'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'address': address,
    'city': city,
    'state': state,
    'stateCode': stateCode,
    'postalCode': postalCode,
    'coordinates': coordinates?.toJson(),
    'country': country,
  };
}
