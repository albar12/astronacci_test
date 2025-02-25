import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class BaseDioRetryInterceptor {
  BaseDioRetryInterceptor._();

  static RetryInterceptor getInterceptor(Dio dio) {
    return RetryInterceptor(
      dio: dio,
      logPrint: print,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3),
      ],
      retryEvaluator: (error, _) {
        return error.type != DioExceptionType.cancel && error.type != DioExceptionType.badResponse && error.type != DioExceptionType.connectionError;
      },
    );
  }
}
