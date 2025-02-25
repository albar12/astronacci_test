class ChangePasswordRequestDto {
  String old_password;
  String password;
  String password_confirmation;

  ChangePasswordRequestDto({
    required this.old_password,
    required this.password,
    required this.password_confirmation,
  });

  Map<String, dynamic> toMap() {
    return {
      'old_password': old_password,
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }

  @override
  String toString() {
    return "Change Password Request DTO (old_password: $old_password, password: $password, password_confirmation: $password_confirmation)";
  }
}
