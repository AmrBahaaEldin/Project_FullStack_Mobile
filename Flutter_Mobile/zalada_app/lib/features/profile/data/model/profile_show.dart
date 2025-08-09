import 'address.dart';
import 'bank.dart';
import 'company.dart';
import 'crypto.dart';
import 'hair.dart';

class ProfileShow {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  double? height;
  double? weight;
  String? eyeColor;
  Hair? hair;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;
  Crypto? crypto;
  String? role;

  ProfileShow({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  factory ProfileShow.fromJson(Map<String, dynamic> json) => ProfileShow(
    id: json['id'] as int?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    maidenName: json['maidenName'] as String?,
    age: json['age'] as int?,
    gender: json['gender'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    username: json['username'] as String?,
    password: json['password'] as String?,
    birthDate: json['birthDate'] as String?,
    image: json['image'] as String?,
    bloodGroup: json['bloodGroup'] as String?,
    height: (json['height'] as num?)?.toDouble(),
    weight: (json['weight'] as num?)?.toDouble(),
    eyeColor: json['eyeColor'] as String?,
    hair: json['hair'] == null
        ? null
        : Hair.fromJson(json['hair'] as Map<String, dynamic>),
    ip: json['ip'] as String?,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    macAddress: json['macAddress'] as String?,
    university: json['university'] as String?,
    bank: json['bank'] == null
        ? null
        : Bank.fromJson(json['bank'] as Map<String, dynamic>),
    company: json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
    ein: json['ein'] as String?,
    ssn: json['ssn'] as String?,
    userAgent: json['userAgent'] as String?,
    crypto: json['crypto'] == null
        ? null
        : Crypto.fromJson(json['crypto'] as Map<String, dynamic>),
    role: json['role'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'maidenName': maidenName,
    'age': age,
    'gender': gender,
    'email': email,
    'phone': phone,
    'username': username,
    'password': password,
    'birthDate': birthDate,
    'image': image,
    'bloodGroup': bloodGroup,
    'height': height,
    'weight': weight,
    'eyeColor': eyeColor,
    'hair': hair?.toJson(),
    'ip': ip,
    'address': address?.toJson(),
    'macAddress': macAddress,
    'university': university,
    'bank': bank?.toJson(),
    'company': company?.toJson(),
    'ein': ein,
    'ssn': ssn,
    'userAgent': userAgent,
    'crypto': crypto?.toJson(),
    'role': role,
  };
}
