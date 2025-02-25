class BaseResponseFailure {
  final Meta meta;
  final DetailsError? details;

  BaseResponseFailure({
    required this.meta,
    this.details,
  });

  factory BaseResponseFailure.fromJson(Map<String, dynamic> json) {
    return BaseResponseFailure(
      meta: Meta.fromJson(json['meta']),
      details: json['details'] != null ? DetailsError.fromJson(json['details']) : null,
    );
  }
}

class DetailsError {
  final String message;
  final String field;
  final String validation;

  DetailsError({
    required this.message,
    required this.field,
    required this.validation,
  });

  factory DetailsError.fromJson(Map<String, dynamic> json) {
    return DetailsError(
      message: json['message'],
      field: json['field'],
      validation: json['validation'],
    );
  }
}

class Meta {
  final int status;
  final String message;
  final String? emailOTP;
  final int? page;
  final int? perPage;
  final int? lastPage;
  final int? total;
  final int? offset;

  Meta({
    required this.status,
    required this.message,
    this.emailOTP,
    this.page,
    this.perPage,
    this.lastPage,
    this.total,
    this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      status: json['status'],
      message: json['message'],
      emailOTP: json['email'],
      page: json['page'],
      perPage: json['perPage'],
      lastPage: json['lastPage'],
      total: json['total'],
    );
  }

  static Meta empty() {
    return Meta(
      status: 0,
      message: '',
      emailOTP: '',
      page: 0,
      offset: 0,
      perPage: 10,
    );
  }
}
