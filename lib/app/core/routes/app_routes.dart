import 'package:flutter/material.dart';

import '/path.dart';

class AppRoutes {
  /// static variable untuk menyimpan routes dan akan diberikan ke root class di [SimbusApp] dalam file `app.dart`
  ///
  /// structure routes yang didaftarkan seperti ini
  /// contoh ada 1 routes class screen seperti ini :
  /// RouteKeys.login: (context) => const LoginScreen(),
  /// RouteKeys.login = ini merupakan variable login dari dalam class [RouteKeys]
  /// (context) => const LoginScreen() = ini merupakan function login dari dalam class [LoginScreen]
  /// --
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteKeys.splash: (context) => const SplashScreen(),
    RouteKeys.home: (context) => const HomeScreen(),
    RouteKeys.profile: (context) => const ProfileScreen(),
    RouteKeys.auth: (context) => const AuthScreen(),
    RouteKeys.signUp: (context) => const SignUpScreen(),
  };
}
