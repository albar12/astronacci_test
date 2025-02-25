class AuthRequestDto {
  final String username;
  final String password;
  AuthRequestDto({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
    };
  }

  factory AuthRequestDto.fromJson(Map<String, dynamic> json) {
    return AuthRequestDto(
      username: json['username'],
      password: json['password'],
    );
  }

  @override
  String toString() {
    return "Auth Request DTO{username: $username, password: $password}";
  }
}
