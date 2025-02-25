class RegisterRequestDto {
  String name;
  String email;
  String? phone;

  RegisterRequestDto({
    required this.name,
    required this.email,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  @override
  String toString() {
    return 'Register Request DTO (name: $name, email: $email, phone: $phone,)';
  }
}
