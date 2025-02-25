import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '/path.dart';

class DeviceIDServices {
  const DeviceIDServices();
  static const _methodChannelAndroid = MethodChannel('com.trust_wave_services.tracking');
  static const _methodChannelIOS = MethodChannel('com.trust.wave.services.tracking');

  // get device id for android
  /// get from method channel in [MainActivity]
  Future<String?> getAndroidId() async {
    final isAndroid = !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
    try {
      if (isAndroid) {
        return await _methodChannelAndroid.invokeMethod<String>('getDeviceId');
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      customErrorLog(
        "Error platform exception from device id android: ${e.message}",
      );
      rethrow;
    }
  }

  /// get device id for ios
  /// get from method channel in [AppDelegate]
  Future<String?> getIosId() async {
    final isIOS = !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
    try {
      if (isIOS) {
        final result = await _methodChannelIOS.invokeMethod<String>(
          'getDeviceId',
        );
        return result;
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      customErrorLog(
        "Error platform exception from device id ios: ${e.message}",
      );
      rethrow;
    }
  }
}
