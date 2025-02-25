class RegisterUpdateDto {
  String username;
  String email;
  String phone;
  String password;
  String confimationPassword;

  RegisterUpdateDto({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.confimationPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': confimationPassword,
    };
  }

  @override
  String toString() {
    return 'Register Update DTO (username: $username, email: $email, phone: $phone, password: $password, confimationPassword: $confimationPassword,)';
  }
}
