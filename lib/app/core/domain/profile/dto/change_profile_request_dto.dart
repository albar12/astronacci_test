class ChangeProfileRequestDto {
  String email;
  String name;
  String? phone;
  String institution;
  String target_institution;
  String target_occupation;

  ChangeProfileRequestDto({
    required this.email,
    required this.name,
    this.phone,
    required this.institution,
    required this.target_institution,
    required this.target_occupation,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "phone": phone,
      "institution": institution,
      "target_institution": target_institution,
      "target_occupation": target_occupation,
    };
  }

  @override
  String toString() {
    return "Change Profile Request DTO (email: $email, name: $name, phone: $phone, institution: $institution, target_institution: $target_institution, target_occupation: $target_occupation)";
  }
}
