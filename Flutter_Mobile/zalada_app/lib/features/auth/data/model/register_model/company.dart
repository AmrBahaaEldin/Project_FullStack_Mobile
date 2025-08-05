import 'address.dart';

class Company {
  Address? address;
  String? department;
  String? name;
  String? title;

  Company({this.address, this.department, this.name, this.title});

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    department: json['department'] as String?,
    name: json['name'] as String?,
    title: json['title'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'address': address?.toJson(),
    'department': department,
    'name': name,
    'title': title,
  };
}
