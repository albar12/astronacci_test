class ForgotPasswordRequestDto {
  final String email;
  final String password;
  final String password_confirmation;
  ForgotPasswordRequestDto({
    required this.email,
    required this.password,
    required this.password_confirmation,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'new_password': password,
      'new_password_confirmation': password_confirmation,
    };
  }

  @override
  String toString() {
    return 'Forget Password Request DTO (email: $password, email: $password, new_password_confirmation: $password_confirmation)';
  }
}
