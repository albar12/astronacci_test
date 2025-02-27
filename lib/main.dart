import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/path.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  initDependencies();

  runApp(const App());
}
