class BaseResponseFailure {
  final Meta meta;
  final DetailsError? details;

  BaseResponseFailure({required this.meta, this.details});

  factory BaseResponseFailure.fromJson(Map<String, dynamic> json) {
    return BaseResponseFailure(
      meta: Meta.fromJson(json['meta']),
      details:
          json['details'] != null
              ? DetailsError.fromJson(json['details'])
              : null,
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
  final int? status;
  final String message;

  Meta({this.status, required this.message});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(status: json['status'], message: json['message']);
  }

  static Meta empty() {
    return Meta(status: 0, message: '');
  }
}
