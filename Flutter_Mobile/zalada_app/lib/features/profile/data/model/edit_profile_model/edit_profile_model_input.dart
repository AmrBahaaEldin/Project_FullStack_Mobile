class EditProfileInputModel {
  final String? firstName;
  final String? birthDate;
  final String? email;
  final String? phone;
  final String? gender;

  EditProfileInputModel({
    this.firstName,
    this.birthDate,
    this.email,
    this.phone,
    this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "birthDate": birthDate,
      "email": email,
      "phone": phone,
      "gender": gender,
    };
  }
}
