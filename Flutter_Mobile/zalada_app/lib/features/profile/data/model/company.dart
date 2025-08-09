import 'address.dart';

class Company {
  String? department;
  String? name;
  String? title;
  Address? address;

  Company({this.department, this.name, this.title, this.address});

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    department: json['department'] as String?,
    name: json['name'] as String?,
    title: json['title'] as String?,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'department': department,
    'name': name,
    'title': title,
    'address': address?.toJson(),
  };
}
