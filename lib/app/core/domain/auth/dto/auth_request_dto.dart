class AuthRequestDto {
  final String username;
  final String password;
  AuthRequestDto({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {"email": username, "password": password};
  }

  factory AuthRequestDto.fromJson(Map<String, dynamic> json) {
    return AuthRequestDto(username: json['email'], password: json['password']);
  }

  @override
  String toString() {
    return "Auth Request DTO{email: $username, password: $password}";
  }
}
