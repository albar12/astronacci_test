import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/path.dart';

class BukulokaApp extends StatefulWidget {
  const BukulokaApp({super.key});

  @override
  State<BukulokaApp> createState() => _BukulokaAppState();
}

class _BukulokaAppState extends State<BukulokaApp> {
  @override
  void initState() {
    super.initState();
    getDeviceIdByPlatform();
  }

  Future<void> getDeviceIdByPlatform() async {
    const deviceId = DeviceIDServices();
    final storage = di.get<BaseStorage>();
    if (Platform.isAndroid) {
      var responseAndroidId = await deviceId.getAndroidId();
      customInfoLog('Device ID: $responseAndroidId');
      if (responseAndroidId == null) return;
      storage.setString("device-id", responseAndroidId);
    } else if (Platform.isIOS) {
      var responseIosBundleId = await deviceId.getIosId();
      customInfoLog('Device ID: $responseIosBundleId');
      if (responseIosBundleId == null) return;
      storage.setString("device-id", responseIosBundleId);
    } else {
      customWarningLog('Device not supported or Device ID not found.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders.providers,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
