import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '/path.dart';

class TimeZonLocalService {
  const TimeZonLocalService();
  static const _methodChannelAndroid = MethodChannel('com.trust_wave_services.tracking');
  static const _methodChannelIOS = MethodChannel('com.trust.wave.services.tracking');

  Future<String?> getTimeZone() async {
    final isAndroid = !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
    final isIOS = !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

    try {
      if (isAndroid) {
        return await _methodChannelAndroid.invokeMethod<String>('getTimeZoneLocal');
      } else if (isIOS) {
        return await _methodChannelIOS.invokeMethod<String>('getTimeZoneLocal');
      }
    } on PlatformException catch (e) {
      customErrorLog(
        "Error platform exception from get Time zone: ${e.message}",
      );
      rethrow;
    }

    return null;
  }
}
