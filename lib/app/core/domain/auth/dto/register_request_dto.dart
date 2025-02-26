class RegisterRequestDto {
  String name;
  String email;
  String? phone;
  String? password;
  String? passwordConfirm;

  RegisterRequestDto({
    required this.name,
    required this.email,
    this.phone,
    required this.password,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': name,
      'email': email,
      'no_whatsapp': phone,
      'password': password,
      'password_confirmation': passwordConfirm,
    };
  }

  @override
  String toString() {
    return 'Register Request DTO (name: $name, email: $email, phone: $phone,password: $password,password_confirmation: $passwordConfirm,)';
  }
}
