class UsersRequestDto {
  final String? search;
  final int page;
  final int perPage;

  UsersRequestDto({this.search, required this.page, required this.perPage});

  Map<String, dynamic> toMap() {
    return {"search": search, "page": page, "per_page": perPage};
  }

  static UsersRequestDto empty() {
    return UsersRequestDto(search: "", page: 1, perPage: 10);
  }
}
