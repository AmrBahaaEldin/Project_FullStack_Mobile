class RegisterModel {
  bool status;
  String message;
  USerData ?data;

  RegisterModel(
      {required this.status, required this.message,this.data});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        status: json["status"],
        message: json["message"],
        data: json['data'] != null ? USerData.fromJson(json['data']) : null);
  }
}

class USerData {
  int id;
  String name;
  String email;
  String phone;
  String image;
  String token;

  USerData(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.token});
  factory USerData.fromJson(Map<String, dynamic> json) {
    return USerData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        token: json['token']);
  }

}
