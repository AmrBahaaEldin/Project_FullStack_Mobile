import 'coordinates.dart';

class Address {
  String? address;
  String? city;
  Coordinates? coordinates;
  String? postalCode;
  String? state;

  Address({
    this.address,
    this.city,
    this.coordinates,
    this.postalCode,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json['address'] as String?,
    city: json['city'] as String?,
    coordinates: json['coordinates'] == null
        ? null
        : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    postalCode: json['postalCode'] as String?,
    state: json['state'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'address': address,
    'city': city,
    'coordinates': coordinates?.toJson(),
    'postalCode': postalCode,
    'state': state,
  };
}
