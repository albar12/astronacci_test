import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

/// Util untuk mengakses url dengan memanfaat kan package [UrlLauncher]
class LauncherUrl {
  // open url
  static Future<dynamic> openAndLaunchUrl(String url) async {
    try {
      // mengecek apakah url bisa diakses
      if (await canLaunchUrl(Uri.parse(url))) {
        // jika bisa diakses lalu dijalankan dengan mode launch yaitu external application
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        // jika tidak bisa diakses lalu menampilkan error
        throw 'Could not launch $url';
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
