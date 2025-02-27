import 'package:dartz/dartz.dart';

import '/path.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource authLocalDatasource;
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImpl(this.authLocalDatasource, this.authRemoteDatasource);

  @override
  Future<Either<BaseResponseFailure, ResponseMsg>> authRegister(
    RegisterRequestDto request,
  ) async {
    try {
      var response = await authRemoteDatasource.authRegister(request);
      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, ResponseMsg>> requestOTPRegister(
    String email,
  ) async {
    return authRemoteDatasource.requestOTPRegister(email);
  }

  @override
  Future<Either<BaseResponseFailure, ResponseMsg>> verifyRegister(
    String email,
    String code,
  ) async {
    try {
      var response = await authRemoteDatasource.verifyRegister(email, code);
      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, User>> authLogin(
    AuthRequestDto request,
  ) async {
    try {
      var response = await authRemoteDatasource.authLogin(request);
      if (response.isRight()) {
        var token =
            response.getOrElse(() {
              customErrorLog(
                "Error get token from activation code : $response",
              );
              throw Exception("Error get token");
            }).token;

        var nama =
            response.getOrElse(() {
              customErrorLog("Error get name from activation code : $response");
              throw Exception("Error get name");
            }).nama;

        var email =
            response.getOrElse(() {
              customErrorLog("Error get name from activation code : $response");
              throw Exception("Error get name");
            }).email;

        await authLocalDatasource.saveToken(token ?? "");
        await authLocalDatasource.saveIsLogin(true);
        await authLocalDatasource.saveName(nama);
        await authLocalDatasource.saveEmail(email);
      }

      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<bool?> getIsLogin() async {
    var isLogin = await authLocalDatasource.getIsLogin();
    return isLogin;
  }

  @override
  Future<Either<BaseResponseFailure, ResponseMsg>> authForgotPassword(
    String email,
  ) async {
    return authRemoteDatasource.authForgotPassword(email);
  }

  @override
  Future<Either<BaseResponseFailure, ResponseMsg>> requestOTP(
    String email,
  ) async {
    return authRemoteDatasource.requestOTP(email);
  }

  @override
  Future<Either<BaseResponseFailure, ResponseMsg>> verifyForgotPassword(
    String email,
    String code,
  ) async {
    try {
      var response = await authRemoteDatasource.verifyForgotPassword(
        email,
        code,
      );
      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, ResponseMsg>> ForgotPasswordFormSubmit(
    ForgotPasswordRequestDto request,
  ) async {
    try {
      return authRemoteDatasource.ForgotPasswordFormSubmit(request);
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, UserWithPage>> getListUsers(
    UsersRequestDto request,
  ) async {
    return authRemoteDatasource.getListUsers(request);
  }

  @override
  Future<Either<BaseResponseFailure, void>> authLogout() async {
    try {
      await authLocalDatasource.removeIsLogin();
      return right(null);
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }
}
