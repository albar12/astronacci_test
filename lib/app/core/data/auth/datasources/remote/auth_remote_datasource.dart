import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '/path.dart';

class AuthRemoteDatasource extends BaseDioService {
  Future<Either<BaseResponseFailure, Auth>> authLogin(
    AuthRequestDto request,
  ) async {
    return await baseFunction<BaseResponseFailure, Auth>(
      fromJson: (data) => Auth.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(
        '${EndpointAPIV1.auth}/login/${AppConfig.brand}',
        data: request.toMap(),
      ),
      keyData: ['data'],
      customLog:
          "Dari bagian auth login \n request menyeluruh : ${request.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, ForgotPasswordModel>> authForgotPassword(
    String email,
  ) async {
    var data = {'username': email};
    return await baseFunction<BaseResponseFailure, ForgotPasswordModel>(
      fromJson: (data) => ForgotPasswordModel.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(
        '${EndpointAPIV1.auth}/forgot/${AppConfig.brand}',
        data: data,
      ),
      keyData: ['data'],
      customLog:
          "Dari bagian auth forgot password \n request menyeluruh : ${email.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, Meta>> requestOTP(String email) async {
    return await baseFunction<BaseResponseFailure, Meta>(
      fromJson: (data) => Meta.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.get(
        '${EndpointAPIV1.auth}/forgot/${AppConfig.brand}/$email',
      ),
      keyData: ['meta'],
      customLog: "Dari bagian request OTP",
    );
  }

  Future<Either<BaseResponseFailure, Token>> verifyForgotPassword(
    String email,
    String code,
  ) async {
    var data = {'code': code};
    return await baseFunction<BaseResponseFailure, Token>(
      fromJson: (data) => Token.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(
        '${EndpointAPIV1.auth}/forgot/${AppConfig.brand}/$email',
        data: data,
      ),
      keyData: ['data'],
      customLog:
          "Dari bagian verify forgot password \n request menyeluruh : ${code.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, Meta>> ForgotPasswordFormSubmit(
    ForgotPasswordRequestDto request,
    String token,
  ) async {
    var headers = {'Authorization': "Bearer $token"};
    return await baseFunction<BaseResponseFailure, Meta>(
      fromJson: (data) => Meta.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.put(
        '${EndpointAPIV1.auth}/forgot/create/password/${AppConfig.brand}',
        data: request.toMap(),
        options: Options(headers: headers),
      ),
      keyData: ['meta'],
      customLog:
          "Dari bagian forgot password form submit \n request menyeluruh : ${request.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, ResponseMsg>> authRegister(
    RegisterRequestDto request,
  ) async {
    return await baseFunction<BaseResponseFailure, ResponseMsg>(
      fromJson: (data) => ResponseMsg.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(EndpointAPIV1.register, data: request.toMap()),
      keyData: ['message'],
      customLog:
          "Dari bagian auth register \n request menyeluruh : ${request.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, SignUpModel>> authRegisterUpdate(
    RegisterUpdateDto request,
  ) async {
    return await baseFunction<BaseResponseFailure, SignUpModel>(
      fromJson: (data) => SignUpModel.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.put(
        '${EndpointAPIV1.auth}/register/${AppConfig.brand}/update-inactive-member',
        data: request.toMap(),
      ),
      keyData: ['data'],
      customLog:
          "Dari bagian auth register update \n request menyeluruh : ${request.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, SignUpModel>> createPassword(
    PasswordRequestDto request,
    String token,
  ) async {
    var headers = {'Authorization': "Bearer $token"};
    return await baseFunction<BaseResponseFailure, SignUpModel>(
      fromJson: (data) => SignUpModel.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.put(
        '${EndpointAPIV1.auth}/password/create',
        data: request.toMap(),
        options: Options(headers: headers),
      ),
      keyData: ['data'],
      customLog:
          "Dari bagian create password \n request menyeluruh : ${request.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, Meta>> requestOTPRegister(
    String email,
  ) async {
    return await baseFunction<BaseResponseFailure, Meta>(
      fromJson: (data) => Meta.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.get(
        '${EndpointAPIV1.auth}/otp/${AppConfig.brand}/$email',
      ),
      keyData: ['meta'],
      customLog: "Dari bagian request OTP register",
    );
  }

  Future<Either<BaseResponseFailure, Token>> verifyRegister(
    String email,
    String code,
  ) async {
    var data = {'code': code};
    return await baseFunction<BaseResponseFailure, Token>(
      fromJson: (data) => Token.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(
        '${EndpointAPIV1.auth}/otp/${AppConfig.brand}/$email',
        data: data,
      ),
      keyData: ['data'],
      customLog:
          "Dari bagian verify register \n request menyeluruh : ${code.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, Meta>> requestOTPRemoveAccount(
    String email,
  ) async {
    return await baseFunction<BaseResponseFailure, Meta>(
      fromJson: (data) => Meta.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.get(
        '${EndpointAPIV1.member}/otp-delete/${AppConfig.brand}/$email',
      ),
      keyData: ['meta'],
      customLog: "Dari bagian request otp remove account",
    );
  }

  Future<Either<BaseResponseFailure, Meta>> verifyRemoveAccount(
    String email,
    String code,
  ) async {
    var data = {'code': code};
    return await baseFunction<BaseResponseFailure, Meta>(
      fromJson: (data) => Meta.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(
        '${EndpointAPIV1.member}/otp-delete/${AppConfig.brand}/$email',
        data: data,
      ),
      keyData: ['meta'],
      customLog:
          "Dari bagian verify remove account \n request menyeluruh : ${code.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, Meta>> requestOTPDeactiveAccount(
    String email,
  ) async {
    return await baseFunction<BaseResponseFailure, Meta>(
      fromJson: (data) => Meta.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.get(
        '${EndpointAPIV1.member}/otp-deactivated/${AppConfig.brand}/$email',
      ),
      keyData: ['meta'],
      customLog: "Dari bagian request otp deactive account",
    );
  }

  Future<Either<BaseResponseFailure, Meta>> verifyDeactiveAccount(
    String email,
    String code,
  ) async {
    var data = {'code': code};
    return await baseFunction<BaseResponseFailure, Meta>(
      fromJson: (data) => Meta.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(
        '${EndpointAPIV1.member}/otp-deactivated/${AppConfig.brand}/$email',
        data: data,
      ),
      keyData: ['meta'],
      customLog:
          "Dari bagian verify deactive account \n request menyeluruh : ${code.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, Token>> refreshToken(
    String refreshToken,
  ) async {
    var data = {'refreshToken': refreshToken};
    return await baseFunction<BaseResponseFailure, Token>(
      fromJson: (data) => Token.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.put('${EndpointAPIV1.auth}/refresh', data: data),
      keyData: ['data'],
      customLog:
          "Dari bagian refresh Token \n request menyeluruh : ${refreshToken.toString()}",
    );
  }
}
