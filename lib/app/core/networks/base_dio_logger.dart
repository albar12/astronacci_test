import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Class [BaseDioLogger] digunakan untuk menambahkan logger pada Dio.
class BaseDioLogger {
  static Interceptor get logger {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      compact: true,
      maxWidth: 90,
    );
  }
}
