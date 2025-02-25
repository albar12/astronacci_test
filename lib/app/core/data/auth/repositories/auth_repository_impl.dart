import 'package:dartz/dartz.dart';

import '/path.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource authLocalDatasource;
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImpl(this.authLocalDatasource, this.authRemoteDatasource);

  @override
  Future<Either<BaseResponseFailure, Auth>> authLogin(
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

        var name =
            response.getOrElse(() {
              customErrorLog("Error get name from activation code : $response");
              throw Exception("Error get name");
            }).name;

        await authLocalDatasource.saveToken(token?.token ?? '');
        await authLocalDatasource.saveRefreshToken(token?.refreshToken ?? '');
        await authLocalDatasource.saveIdentifier(token?.identifier! ?? '');
        await authLocalDatasource.saveIsLogin(true);
        await authLocalDatasource.saveLastLogin(request.username);
        await authLocalDatasource.saveName(name ?? '');
      }

      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<String> getName() async {
    try {
      var response = await authLocalDatasource.getName();

      return response ?? 'Guest';
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, void>> authLogout() async {
    try {
      await authLocalDatasource.removeToken();
      await authLocalDatasource.removeIdentifier();
      await authLocalDatasource.removeRefreshToken();
      await authLocalDatasource.removeIsLogin();
      return right(null);
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, ForgotPasswordModel>> authForgotPassword(
    String email,
  ) async {
    return authRemoteDatasource.authForgotPassword(email);
  }

  @override
  Future<Either<BaseResponseFailure, Meta>> requestOTP(String email) async {
    return authRemoteDatasource.requestOTP(email);
  }

  @override
  Future<Either<BaseResponseFailure, Token>> verifyForgotPassword(
    String email,
    String code,
  ) async {
    try {
      var response = await authRemoteDatasource.verifyForgotPassword(
        email,
        code,
      );
      if (response.isRight()) {
        var token = response.getOrElse(() {
          customErrorLog("Error get token from activation code : $response");
          throw Exception("Error get token");
        });

        await authLocalDatasource.saveToken(token.token);
        await authLocalDatasource.saveRefreshToken(token.refreshToken);
      }

      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, Meta>> ForgotPasswordFormSubmit(
    ForgotPasswordRequestDto request,
  ) async {
    try {
      var token = await authLocalDatasource.getToken();
      return authRemoteDatasource.ForgotPasswordFormSubmit(
        request,
        token ?? '',
      );
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, InitialRegisterModel>> authRegister(
    RegisterRequestDto request,
  ) async {
    try {
      var response = await authRemoteDatasource.authRegister(request);
      if (response.isRight()) {
        var token = response.getOrElse(() {
          customErrorLog("Error get token from activation code : $response");
          throw Exception("Error get token");
        });
        if (token.token != null && token.token != '') {
          await authLocalDatasource.saveToken(token.token!);
          await authLocalDatasource.saveRefreshToken(token.refreshToken!);
        }
      }
      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, SignUpModel>> authRegisterUpdate(
    RegisterUpdateDto request,
  ) async {
    return authRemoteDatasource.authRegisterUpdate(request);
  }

  @override
  Future<Either<BaseResponseFailure, SignUpModel>> createPassword(
    PasswordRequestDto request,
  ) async {
    try {
      var token = await authLocalDatasource.getToken();
      var response = await authRemoteDatasource.createPassword(
        request,
        token ?? '',
      );
      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, Meta>> requestOTPRegister(
    String email,
  ) async {
    return authRemoteDatasource.requestOTPRegister(email);
  }

  @override
  Future<Either<BaseResponseFailure, Token>> verifyRegister(
    String email,
    String code,
  ) async {
    try {
      var response = await authRemoteDatasource.verifyRegister(email, code);
      if (response.isRight()) {
        var token = response.getOrElse(() {
          customErrorLog("Error get token from activation code : $response");
          throw Exception("Error get token");
        });

        await authLocalDatasource.saveToken(token.token);
        await authLocalDatasource.saveIdentifier(token.identifier ?? '');
        await authLocalDatasource.saveRefreshToken(token.refreshToken);
      }

      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, Meta>> requestOTPRemoveAccount(
    String email,
  ) async {
    return authRemoteDatasource.requestOTPRemoveAccount(email);
  }

  @override
  Future<Either<BaseResponseFailure, Meta>> verifyRemoveAccount(
    String email,
    String code,
  ) async {
    try {
      var response = await authRemoteDatasource.verifyRemoveAccount(
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
  Future<Either<BaseResponseFailure, Meta>> requestOTPDeactiveAccount(
    String email,
  ) async {
    return authRemoteDatasource.requestOTPDeactiveAccount(email);
  }

  @override
  Future<Either<BaseResponseFailure, Meta>> verifyDeactiveAccount(
    String email,
    String code,
  ) async {
    try {
      var response = await authRemoteDatasource.verifyDeactiveAccount(
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
  Future<String?> getToken() async {
    var token = await authLocalDatasource.getToken();
    return token;
  }

  @override
  Future<String?> getIdentifier() async {
    var identifier = await authLocalDatasource.getIdentifier();
    return identifier;
  }

  @override
  Future<String?> getLastLogin() async {
    var lastLogin = await authLocalDatasource.getLastLogin();
    return lastLogin;
  }

  @override
  Future<bool?> getIsLogin() async {
    var isLogin = await authLocalDatasource.getIsLogin();
    return isLogin;
  }

  @override
  Future<String?> getRefreshToken() async {
    var lastLogin = await authLocalDatasource.getRefreshToken();
    return lastLogin;
  }

  @override
  Future<Either<BaseResponseFailure, Token>> refreshToken(
    String refreshToken,
  ) async {
    try {
      var response = await authRemoteDatasource.refreshToken(refreshToken);
      if (response.isRight()) {
        var token =
            response.getOrElse(() {
              customErrorLog(
                "Error get token from activation code : $response",
              );
              throw Exception("Error get token");
            }).token;

        var refreshToken =
            response.getOrElse(() {
              customErrorLog("Error get name from activation code : $response");
              throw Exception("Error get name");
            }).refreshToken;

        await authLocalDatasource.saveToken(token);
        await authLocalDatasource.saveRefreshToken(token);
      }

      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }
}
