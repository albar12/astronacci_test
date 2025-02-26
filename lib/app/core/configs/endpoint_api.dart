/// class [EndpointAPIV1] digunakan untuk menampung endpoint API
/// endpoint yang di tampung di class ini hanya root endpoint API, artinya jika ada path parameter maka route setelah path parameter tersebut tidak akan terbawa
/// seperti contoh
/// /brand/1/user/1 -> /brand/:brand/user/:user
/// yang akan didaftarkan pada class ini hanyalah : /brand
/// sisanya seperti :brand/user/:user tidak dibawa
/// ----
class EndpointAPIV1 {
  static const String activation = '/apps/activation';
  static const String bookLibraryList = '/library';
  static const String bookDigital = '/book-digital';
  static const String memberProfile = '/member/profile';
  static const String member = '/member';
  static const String memberPayment = '/member/payment';
  static const String university = '/new-university';
  static const String premiumBandle = '/premium-bundle';
  static const String bookmark = '/bookmark';
  static const String auth = '/auth';

  static const String login = '/login';
  static const String register = '/register';
  static const String resendOTP = '/resend-otp';
  static const String verifyOTP = '/verify-otp';
}
