class PasswordRequestDto {
  String password;
  String password_confirmation;

  PasswordRequestDto({
    required this.password,
    required this.password_confirmation,
  });

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }

  @override
  String toString() {
    return 'Password Request DTO (password: $password, password_confirmation: $password_confirmation,)';
  }
}
