class BaseResponseToken {
  final String type;
  final String? accessToken;
  final String refreshToken;
  final String? identifier;

  BaseResponseToken({
    required this.type,
    this.accessToken,
    required this.refreshToken,
    required this.identifier,
  });

  factory BaseResponseToken.fromJson(Map<String, dynamic> json) {
    return BaseResponseToken(
      type: json['type'],
      accessToken: json['token'],
      refreshToken: json['refreshToken'],
      identifier: json['identifier'],
    );
  }

  // to String
  @override
  String toString() {
    return 'base response token{type: $type, accessToken: $accessToken, refreshToken: $refreshToken, identifier: $identifier}';
  }
}
