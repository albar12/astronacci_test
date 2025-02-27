import 'package:dartz/dartz.dart';
import '/path.dart';

class AuthRemoteDatasource extends BaseDioService {
  Future<Either<BaseResponseFailure, ResponseMsg>> authRegister(
    RegisterRequestDto request,
  ) async {
    return await baseFunction<BaseResponseFailure, ResponseMsg>(
      fromJson: (data) => ResponseMsg.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(EndpointAPIV1.register, data: request.toMap()),
      customLog:
          "Dari bagian auth register \n request menyeluruh : ${request.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, ResponseMsg>> requestOTPRegister(
    String email,
  ) async {
    var data = {"email": email};
    return await baseFunction<BaseResponseFailure, ResponseMsg>(
      fromJson: (data) => ResponseMsg.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(EndpointAPIV1.resendOTP, data: data),
      customLog: "Dari bagian request OTP register",
    );
  }

  Future<Either<BaseResponseFailure, ResponseMsg>> verifyRegister(
    String email,
    String code,
  ) async {
    var data = {'email': email, 'otp': code};
    return await baseFunction<BaseResponseFailure, ResponseMsg>(
      fromJson: (data) => ResponseMsg.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(EndpointAPIV1.verifyOTP, data: data),
      customLog:
          "Dari bagian verify register \n request menyeluruh : ${data.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, User>> authLogin(
    AuthRequestDto request,
  ) async {
    return await baseFunction<BaseResponseFailure, User>(
      fromJson: (data) => User.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(EndpointAPIV1.login, data: request.toMap()),
      keyData: ['data'],
      customLog:
          "Dari bagian auth login \n request menyeluruh : ${request.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, ResponseMsg>> authForgotPassword(
    String email,
  ) async {
    var data = {'email': email};
    return await baseFunction<BaseResponseFailure, ResponseMsg>(
      fromJson: (data) => ResponseMsg.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(EndpointAPIV1.forgotPassword, data: data),
      customLog:
          "Dari bagian auth forgot password \n request menyeluruh : ${email.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, ResponseMsg>> requestOTP(
    String email,
  ) async {
    var data = {'email': email};

    return await baseFunction<BaseResponseFailure, ResponseMsg>(
      fromJson: (data) => ResponseMsg.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(EndpointAPIV1.forgotPassword, data: data),
      customLog:
          "Dari bagian request OTP \n request menyeluruh : ${email.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, ResponseMsg>> ForgotPasswordFormSubmit(
    ForgotPasswordRequestDto request,
  ) async {
    return await baseFunction<BaseResponseFailure, ResponseMsg>(
      fromJson: (data) => ResponseMsg.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(
        EndpointAPIV1.passwordUpdate,
        data: request.toMap(),
      ),
      customLog:
          "Dari bagian forgot password form submit \n request menyeluruh : ${request.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, UserWithPage>> getListUsers(
    UsersRequestDto request,
  ) async {
    return await baseFunction<BaseResponseFailure, UserWithPage>(
      fromJson: (data) => UserWithPage.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.get(
        EndpointAPIV1.users,
        queryParameters: request.toMap(),
      ),
      keyData: ['data'],
      customLog: "Dari bagian get list users",
    );
  }

  Future<Either<BaseResponseFailure, ResponseMsg>> verifyForgotPassword(
    String email,
    String code,
  ) async {
    var data = {'email': email, 'otp': code};
    return await baseFunction<BaseResponseFailure, ResponseMsg>(
      fromJson: (data) => ResponseMsg.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(EndpointAPIV1.verifyForgotPassword, data: data),
      customLog:
          "Dari bagian verify forgot password \n request menyeluruh : ${data.toString()}",
    );
  }
}
