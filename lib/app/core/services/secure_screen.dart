import 'package:flutter/services.dart';

import '/path.dart';

class SecureScreen {
  static const MethodChannel _channel = MethodChannel('com.trust_wave_services.tracking');

  static Future<void> setSecureScreen(bool secure) async {
    try {
      await _channel.invokeMethod('setSecureScreen', {'secure': secure});
    } on PlatformException catch (e) {
      customErrorLog(
        "Error setting secure screen: $e",
      );
      rethrow;
    }
  }
}
