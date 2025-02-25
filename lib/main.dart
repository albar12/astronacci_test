import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/path.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  initDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const BukulokaApp(),
    ),
  );
}
