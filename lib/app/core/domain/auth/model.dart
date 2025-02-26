import '/path.dart';

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
  final String token;

  User({
    required this.id,
    required this.nama,
    required this.email,
    required this.noWhatsapp,
    required this.isActive,
    required this.token,
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

class Auth {
  final int? id;
  final int? id_number;
  final String? name;
  final String? email;
  final String? phone;
  final String? institution;
  final int? program_study_exam_id;
  final String? educational_stage;
  final String? target_institution;
  final String? target_occupation;
  final String? semester;
  final String? class_year;
  final String? exam_date;
  final String? brand;
  final String? created_at;
  final String? updated_at;
  final Token? token;

  Auth({
    required this.id,
    this.id_number,
    required this.name,
    required this.email,
    required this.phone,
    required this.institution,
    this.program_study_exam_id,
    this.educational_stage,
    this.target_institution,
    this.target_occupation,
    this.semester,
    this.class_year,
    this.exam_date,
    this.brand,
    required this.created_at,
    this.updated_at,
    this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      id: json['id'],
      id_number: json['id_number'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      institution: json['institution'],
      program_study_exam_id: json['program_study_exam_id'],
      educational_stage: json['educational_stage'],
      target_institution: json['target_institution'],
      target_occupation: json['target_occupation'],
      semester: json['semester'],
      class_year: json['class_year'],
      exam_date: json['exam_date'],
      brand: json['brand'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      token: json['token'] != null ? Token.fromJson(json['token']) : null,
    );
  }
}

class SignUpModel {
  int id;
  String name;
  String email;
  String? phone;
  String? institution;
  String? target_institution;
  String? target_occupation;
  String created_at;
  String? updated_at;

  SignUpModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.institution,
    this.target_institution,
    this.target_occupation,
    required this.created_at,
    this.updated_at,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      institution: json['institution'],
      target_institution: json['target_institution'],
      target_occupation: json['target_occupation'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}

class InitialRegisterModel {
  String? name;
  String? email;
  String? phone;
  String? brand;
  String? create_at;
  String? update_at;
  int? id;
  String? token;
  String? refreshToken;
  String? identifier;
  InitialRegisterModel({
    this.name,
    this.email,
    this.phone,
    this.brand,
    this.create_at,
    this.update_at,
    this.id,
    this.token,
    this.refreshToken,
    this.identifier,
  });

  factory InitialRegisterModel.fromJson(Map<String, dynamic> json) {
    return InitialRegisterModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      brand: json['brand'],
      create_at: json['created_at'],
      update_at: json['updated_at'],
      id: json['id'],
      token: json['token'],
      refreshToken: json['refreshToken'],
      identifier: json['identifier'],
    );
  }
}

class Token {
  final String type;
  final String token;
  final String refreshToken;
  final String? identifier;

  Token({
    required this.type,
    required this.token,
    required this.refreshToken,
    this.identifier,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      type: json['type'],
      token: json['token'],
      refreshToken: json['refreshToken'],
      identifier: json['identifier'] ?? "",
    );
  }
}

class AuthGoogle {
  String tokenId;
  String name;
  String email;

  AuthGoogle({required this.tokenId, required this.name, required this.email});

  factory AuthGoogle.fromJson(Map<String, dynamic> json) {
    return AuthGoogle(
      tokenId: json['tokenId'],
      name: json['name'],
      email: json['email'],
    );
  }
  static AuthGoogle empty() {
    return AuthGoogle(tokenId: '', name: '', email: '');
  }

  @override
  String toString() {
    return "Auth Google (tokenId: $tokenId, name: $name, email: $email)";
  }
}

class AuthGoogleRegister {
  String? phone;
  String? brand;
  String? google_id;
  String? email;
  String? google_email;
  String? name;
  String? created_at;
  String? updated_at;
  int id;

  AuthGoogleRegister({
    this.phone,
    this.brand,
    this.google_id,
    this.email,
    this.google_email,
    this.name,
    this.created_at,
    this.updated_at,
    required this.id,
  });

  factory AuthGoogleRegister.fromJson(Map<String, dynamic> json) {
    return AuthGoogleRegister(
      phone: json['phone'],
      brand: json['brand'],
      google_id: json['google_id'],
      email: json['email'],
      google_email: json['google_email'],
      name: json['name'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      id: json['id'],
    );
  }
  static AuthGoogleRegister empty() {
    return AuthGoogleRegister(
      phone: '',
      brand: '',
      google_id: '',
      email: '',
      google_email: '',
      name: '',
      created_at: '',
      updated_at: '',
      id: 0,
    );
  }

  @override
  String toString() {
    return "Auth Google Register (phone: $phone, brand: $brand, google_id: $google_id, email: $email, google_email: $google_email, name: $name, created_at: $created_at, updated_at: $updated_at, id: $id)";
  }
}

class BundlesModelWithMeta {
  final List<BundlesModel>? data;
  final List<PremiumBookModel>? books;
  Meta meta;
  BundlesModelWithMeta({this.data, this.books, required this.meta});

  factory BundlesModelWithMeta.fromJson(Map<String, dynamic> json) {
    return BundlesModelWithMeta(
      data:
          json['data']['bundles'] is List<dynamic>
              ? List<BundlesModel>.from(
                json['data']['bundles'].map((x) => BundlesModel.fromJson(x)),
              )
              : [],
      books:
          json['data']['books'] is List<dynamic>
              ? List<PremiumBookModel>.from(
                json['data']['books'].map((x) => PremiumBookModel.fromJson(x)),
              )
              : [],
      meta: Meta.fromJson(json['meta']),
    );
  }

  factory BundlesModelWithMeta.empty() {
    return BundlesModelWithMeta(data: [], meta: Meta.empty());
  }
}

class BundlesModel {
  final int id;
  final int? member_id;
  final String? order_no;
  final String? name;
  final String? email;
  final String? phone;
  final String? brand;
  final int? online_product_order_id;
  final int? premium_bundle_id;
  final String? duration_time;
  final String? created_at;
  final String? updated_at;
  final PremiumBundleMember? premiumBundle;
  final bool? status;

  BundlesModel({
    required this.id,
    this.member_id,
    this.order_no,
    this.name,
    this.email,
    this.phone,
    this.brand,
    this.online_product_order_id,
    this.premium_bundle_id,
    this.duration_time,
    this.created_at,
    this.updated_at,
    this.premiumBundle,
    this.status,
  });

  factory BundlesModel.fromJson(Map<String, dynamic> json) {
    return BundlesModel(
      id: json['id'],
      member_id: json['member_id'],
      order_no: json['order_no'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      brand: json['brand'],
      online_product_order_id: json['online_product_order_id'],
      premium_bundle_id: json['premium_bundle_id'],
      duration_time: json['duration_time'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      premiumBundle:
          json['PremiumBundle'] is Map<String, dynamic>
              ? PremiumBundleMember.fromJson(json['PremiumBundle'])
              : null,
      status: json['status'],
    );
  }
}

class PremiumBundleMember {
  final int id;
  final String? name;
  final String? description;
  final List<dynamic>? benefits;
  final String? brand;
  final int? primary_price;
  final int? price;
  final int? discount_price;
  final int? marketing_lowest_retail_price;
  final int? duration_time;
  final int? is_active;
  final String? created_at;
  final String? updated_at;
  final bool? status;

  PremiumBundleMember({
    required this.id,
    this.name,
    this.description,
    this.benefits,
    this.brand,
    this.primary_price,
    this.price,
    this.discount_price,
    this.marketing_lowest_retail_price,
    this.duration_time,
    this.is_active,
    this.created_at,
    this.updated_at,
    this.status,
  });

  factory PremiumBundleMember.fromJson(Map<String, dynamic> json) {
    return PremiumBundleMember(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      benefits: json['benefits'] is List<dynamic> ? json['benefits'] : null,
      brand: json['brand'],
      primary_price: json['primary_price'],
      price: json['price'],
      discount_price: json['discount_price'],
      marketing_lowest_retail_price: json['marketing_lowest_retail_price'],
      duration_time: json['duration_time'],
      is_active: json['is_active'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      status: json['status'],
    );
  }
}

class PremiumBookModel {
  final int id;
  final int? member_id;
  final String? order_no;
  final String? name;
  final String? email;
  final String? phone;
  final String? brand;
  final int? online_product_order_id;
  final int? book_digital_id;
  final String? duration_time;
  final String? created_at;
  final String? updated_at;
  final PremiumBookMember? bookDigital;
  final bool? status;
  final int? bundle_flag;

  PremiumBookModel({
    required this.id,
    this.member_id,
    this.order_no,
    this.name,
    this.email,
    this.phone,
    this.brand,
    this.online_product_order_id,
    this.book_digital_id,
    this.duration_time,
    this.created_at,
    this.updated_at,
    this.bookDigital,
    this.status,
    this.bundle_flag,
  });

  factory PremiumBookModel.fromJson(Map<String, dynamic> json) {
    return PremiumBookModel(
      id: json['id'],
      member_id: json['member_id'],
      order_no: json['order_no'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      brand: json['brand'],
      online_product_order_id: json['online_product_order_id'],
      book_digital_id: json['book_digital_id'],
      duration_time: json['duration_time'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      bookDigital:
          json['BookDigital'] is Map<String, dynamic>
              ? PremiumBookMember.fromJson(json['BookDigital'])
              : null,
      status: json['status'],
      bundle_flag: json['bundle_flag'],
    );
  }
}

class PremiumBookMember {
  final int id;
  final String? sku;
  final String? title;
  final int? duration_time;
  final int? is_active;
  final String? image_name;
  final String? image_url;
  final String? pdf_name;
  final String? pdf_url;
  final String? published_at;
  final String? created_at;
  final String? updated_at;

  PremiumBookMember({
    required this.id,
    this.sku,
    this.title,
    this.duration_time,
    this.is_active,
    this.image_name,
    this.image_url,
    this.pdf_name,
    this.pdf_url,
    this.published_at,
    this.created_at,
    this.updated_at,
  });

  factory PremiumBookMember.fromJson(Map<String, dynamic> json) {
    return PremiumBookMember(
      id: json['id'],
      sku: json['sku'],
      title: json['title'],
      duration_time: json['duration_time'],
      is_active: json['is_active'],
      image_name: json['image_name'],
      image_url: json['image_url'],
      pdf_name: json['pdf_name'],
      pdf_url: json['pdf_url'],
      published_at: json['published_at'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}

class ForgotPasswordModel {
  String email;
  ForgotPasswordModel({required this.email});

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModel(email: json['email']);
  }
}
