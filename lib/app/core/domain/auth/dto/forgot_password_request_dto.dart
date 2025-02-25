class ForgotPasswordRequestDto {
  final String password;
  final String password_confirmation;
  ForgotPasswordRequestDto({
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
    return 'Forget Password Request DTO (password: $password, password_confirmation: $password_confirmation)';
  }
}
