class RemoveAccountRequestDto {
  String username;
  String password;
  String password_confirmation;

  RemoveAccountRequestDto({
    required this.username,
    required this.password,
    required this.password_confirmation,
  });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
      "password_confirmation": password_confirmation,
    };
  }

  @override
  String toString() {
    return "Remove Account Request DTO (username: $username, password: $password, password_confirmation: $password_confirmation)";
  }
}
