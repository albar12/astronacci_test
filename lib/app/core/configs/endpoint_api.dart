/// class [EndpointAPIV1] digunakan untuk menampung endpoint API
/// endpoint yang di tampung di class ini hanya root endpoint API, artinya jika ada path parameter maka route setelah path parameter tersebut tidak akan terbawa
/// seperti contoh
/// /brand/1/user/1 -> /brand/:brand/user/:user
/// yang akan didaftarkan pada class ini hanyalah : /brand
/// sisanya seperti :brand/user/:user tidak dibawa
/// ----
class EndpointAPIV1 {
  static const String login = '/login';
  static const String register = '/register';
  static const String resendOTP = '/resend-otp';
  static const String verifyOTP = '/verify-otp';
  static const String forgotPassword = '/password/request-otp';
  static const String verifyForgotPassword = '/password/verify-otp';
  static const String passwordUpdate = '/password/update';
  static const String users = '/users';
  static const String profile = '/profile';
  static const String profileUpdate = '/profile/update';
}
