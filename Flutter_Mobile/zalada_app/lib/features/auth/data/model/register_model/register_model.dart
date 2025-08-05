import 'address.dart';
import 'bank.dart';
import 'company.dart';
import 'hair.dart';

class RegisterModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  dynamic age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  dynamic height;
  dynamic weight;
  String? eyeColor;
  Hair? hair;
  String? domain;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;

  RegisterModel({
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
    this.domain,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    id: json['id'] as int?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    maidenName: json['maidenName'] as String?,
    age: json['age'] as dynamic,
    gender: json['gender'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    username: json['username'] as String?,
    password: json['password'] as String?,
    birthDate: json['birthDate'] as String?,
    image: json['image'] as String?,
    bloodGroup: json['bloodGroup'] as String?,
    height: json['height'] as dynamic,
    weight: json['weight'] as dynamic,
    eyeColor: json['eyeColor'] as String?,
    hair: json['hair'] == null
        ? null
        : Hair.fromJson(json['hair'] as Map<String, dynamic>),
    domain: json['domain'] as String?,
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
    'domain': domain,
    'ip': ip,
    'address': address?.toJson(),
    'macAddress': macAddress,
    'university': university,
    'bank': bank?.toJson(),
    'company': company?.toJson(),
    'ein': ein,
    'ssn': ssn,
    'userAgent': userAgent,
  };
}
