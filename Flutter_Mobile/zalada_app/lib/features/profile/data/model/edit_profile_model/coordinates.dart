class Coordinates {
  dynamic lat;
  dynamic lng;

  Coordinates({this.lat, this.lng});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      Coordinates(lat: json['lat'] as dynamic, lng: json['lng'] as dynamic);

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}
