import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '/path.dart';

/// class [BaseDioService] digunakan untuk menampung client dio
/// client ini digunakan untuk mengirimkan request ke server
class BaseDioService {
  /// variable dio ini dibuat private agar tidak bisa diakses secara langsung
  /// untuk dapat diakses pada class lain, harus menggunakan method getter
  final Dio _dio = Dio();
  Dio get dio => _dio;

  /// constructor [BaseDioService] ini dibuat untuk menampung client dio dan dilempar kembali ke private variable _dio
  /// didalam nya juga di deklarasikan options default untuk dio seperti
  /// 1. Base URL
  /// 2. content type
  /// 3. connect, send, receive timeout
  /// 4. followredirects
  /// 5. headers yang berisikan accept dan token (sementara di hilangkan, bagian ini didapatkan dari pref token)
  BaseDioService() {
    initDio();
  }

  Future<void> initDio() async {
    dio.options.baseUrl = AppConfig.baseURL;
    dio.options.contentType = 'application/json';
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.sendTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.followRedirects = false;
    dio.options.headers = {"Accept": "application/json"};

    dio.interceptors.add(BaseDioLogger.logger);
    dio.interceptors.add(await BaseDioCacheManager.dioCacheInterceptor);
    dio.interceptors.add(BaseDioRetryInterceptor.getInterceptor(dio));

    customInfoLog("init dio service");
    var timezone = await const TimeZonLocalService().getTimeZone();
    customInfoLog("timezone: $timezone");
    if (timezone != null) {
      dio.options.headers = {"X-Timezone": timezone};
    }
  }

  // base function
  Future<Either<E, T>> baseFunction<E, T>({
    T Function(Map<String, dynamic> data)? fromJson,
    T Function(Meta? meta, List<dynamic> data)? fromJsonList,
    required E Function(Map<String, dynamic> data) fromJsonError,
    required Future<Response> responseMethod,
    String customLog = "",
    List<String> keyData = const [],
    // with meta for from json list
    bool wihtMetaList = true,
  }) async {
    try {
      // asynchronously get response
      var response = await responseMethod;
      // --
      // mapping to 'data' and 'meta'

      var data = response.data;
      for (var key in keyData) {
        if (data.containsKey(key)) {
          data = data[key];
        }
      }
      // logging data response
      customInfoLog("data response: $data");
      // return Data with conditional
      // if fromJson is null then return fromJsonList
      // fromJsonList have 2 param [meta, data]
      return Right(
        fromJson != null
            ? fromJson(data)
            : fromJsonList != null
            ? wihtMetaList
                ? fromJsonList(Meta.fromJson(response.data['meta']), data)
                : fromJsonList(null, data)
            : data,
      );
    } on DioException catch (e) {
      customErrorLog("error dio: $e");
      customErrorLog("error type : ${e.type}");

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return Left(
          fromJsonError({
            "meta": {
              "message": "Koneksi Bermasalah, Silahkan Coba Lagi",
              "status": 408,
            },
          }),
        );
      }

      // jika error dio connection error maka mengembalikan error
      if (e.type == DioExceptionType.connectionError) {
        return Left(
          fromJsonError({
            "meta": {
              "message": "Koneksi Bermasalah, Silahkan Coba Lagi",
              "status": 408,
            },
          }),
        );
      }

      // jika error tidak di ketahui maka akan mengembalikan error 500
      return Left(
        fromJsonError({
          "meta": {
            "message": e.response!.data['message'] ?? 'Terjadi Kesalahan',
            "status": e.response!.statusCode ?? 500,
          },
        }),
      );
    } catch (e) {
      customErrorLog("error catch: $e");
      // error catch hanya berlaku jika block try gagal dijalankan
      return Left(
        fromJsonError({
          "meta": {"message": 'Terjadi Kesalahan', "status": 500},
        }),
      );
    }
  }
}
