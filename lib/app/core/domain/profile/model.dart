class ProfileModel {
  final int id;
  final int? id_number;
  final String? name;
  final String? email;
  final String? google_email;
  final String? phone;
  final String? institution;
  final int? program_study_exam_id;
  final String? educational_stage;
  final String? target_institution;
  final String? target_occupation;
  final String? semester;
  final String? class_year;
  final String? exam_date;
  final int? google_id;
  final String? brand;
  final String? created_at;
  final String? updated_at;
  final String? program_study;
  final List<MemberBundle>? member_bundle;
  final List<MemberBook>? member_book;

  ProfileModel({
    required this.id,
    this.id_number,
    this.name,
    this.email,
    this.google_email,
    this.phone,
    this.institution,
    this.program_study_exam_id,
    this.educational_stage,
    this.target_institution,
    this.target_occupation,
    this.semester,
    this.class_year,
    this.exam_date,
    this.google_id,
    this.brand,
    required this.created_at,
    this.updated_at,
    this.program_study,
    this.member_bundle,
    this.member_book,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
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
      member_bundle: json['member_bundle'] is List<dynamic>
          ? List<MemberBundle>.from(
              json['member_bundle'].map((x) => MemberBundle.fromJson(x)),
            )
          : [],
      member_book: json['member_book'] is List<dynamic>
          ? List<MemberBook>.from(
              json['member_book'].map((x) => MemberBook.fromJson(x)),
            )
          : [],
    );
  }

  static ProfileModel empty() {
    return ProfileModel(
      id: 0,
      id_number: 0,
      name: '',
      email: '',
      phone: '',
      institution: '',
      program_study_exam_id: 0,
      educational_stage: '',
      target_institution: '',
      target_occupation: '',
      semester: '',
      class_year: '',
      exam_date: '',
      brand: '',
      created_at: '',
      updated_at: '',
    );
  }
}

class MemberBundle {
  int id;
  String order_no;
  int? online_product_order_id;
  int? premium_bundle_id;
  String duration_time;
  bool status;

  MemberBundle({
    required this.id,
    required this.order_no,
    required this.online_product_order_id,
    required this.premium_bundle_id,
    required this.duration_time,
    required this.status,
  });

  factory MemberBundle.fromJson(Map<String, dynamic> json) {
    return MemberBundle(
      id: json['id'],
      order_no: json['order_no'],
      online_product_order_id: json['online_product_order_id'],
      premium_bundle_id: json['premium_bundle_id'],
      duration_time: json['duration_time'],
      status: json['status'],
    );
  }
}

class MemberBook {
  int id;
  String order_no;
  int? online_product_order_id;
  int? book_digital_id;
  String? duration_time;
  bool status;

  MemberBook({
    required this.id,
    required this.order_no,
    required this.online_product_order_id,
    required this.book_digital_id,
    required this.duration_time,
    required this.status,
  });

  factory MemberBook.fromJson(Map<String, dynamic> json) {
    return MemberBook(
      id: json['id'],
      order_no: json['order_no'],
      online_product_order_id: json['online_product_order_id'],
      book_digital_id: json['book_digital_id'],
      duration_time: json['duration_time'],
      status: json['status'],
    );
  }
}

class UniversityModel {
  int id;
  String name;

  UniversityModel({
    required this.id,
    required this.name,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String toString() {
    return name;
  }
}
