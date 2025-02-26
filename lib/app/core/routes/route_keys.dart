/// --- [RouteKeys]
///
/// class [RouteKeys] digunakan untuk menyimpan routes dan akan diberikan ke root class di [SimbusApp] dalam file `app.dart`
/// class ini hanya berisikan variable static yang bertipe [String] dengan nama routes pada class tersebut
///
class RouteKeys {
  // splash module
  static const String splash = '/';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String bookmarks = '/bookmarks';
  static const String auth = '/auth';
  static const String signUp = '/sign-up';
  static const String search = '/search';
}
