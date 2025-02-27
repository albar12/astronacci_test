class ResponseMsg {
  final String message;
  ResponseMsg({required this.message});
  factory ResponseMsg.fromJson(Map<String, dynamic> json) {
    return ResponseMsg(message: json['message']);
  }
}

class User {
  final int id;
  final String nama;
  final String email;
  final String noWhatsapp;
  final bool isActive;
  final String? token;

  User({
    required this.id,
    required this.nama,
    required this.email,
    required this.noWhatsapp,
    required this.isActive,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nama: json['nama'],
      email: json['email'],
      noWhatsapp: json['no_whatsapp'],
      isActive: json['is_active'],
      token: json['token'],
    );
  }
}

class UserWithPage {
  final List<User> data;
  final int currentPage;
  UserWithPage({required this.data, required this.currentPage});

  factory UserWithPage.fromJson(Map<String, dynamic> json) {
    return UserWithPage(
      data:
          json['data'] is List<dynamic>
              ? List<User>.from(json['data'].map((x) => User.fromJson(x)))
              : [],
      currentPage: json['current_page'],
    );
  }
}
