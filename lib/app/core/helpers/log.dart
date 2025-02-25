import 'package:logger/logger.dart';

/// Logger ini digunakan untuk menyimpan log dari aplikasi
var logger = Logger(
  printer: PrefixPrinter(
    PrettyPrinter(colors: false),
  ),
);
void customErrorLog(String message) {
  logger.e(message);
}

void customWarningLog(String message) {
  logger.w(message);
}

void customInfoLog(String message) {
  logger.i(message);
}
