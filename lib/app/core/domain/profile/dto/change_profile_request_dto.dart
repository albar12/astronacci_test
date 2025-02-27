class ChangeProfileRequestDto {
  String email;
  String nama;
  String phone;

  ChangeProfileRequestDto({
    required this.email,
    required this.nama,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {"email": email, "nama": nama, "no_whatsapp": phone};
  }

  @override
  String toString() {
    return "Change Profile Request DTO (email: $email, nama: $nama, no_whatsapp: $phone";
  }
}
