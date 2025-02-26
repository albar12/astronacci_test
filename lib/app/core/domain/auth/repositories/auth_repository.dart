import 'package:dartz/dartz.dart';

import '/path.dart';

abstract class AuthRepository {
  Future<Either<BaseResponseFailure, ResponseMsg>> authRegister(
    RegisterRequestDto request,
  );

  Future<Either<BaseResponseFailure, ResponseMsg>> requestOTPRegister(
    String email,
  );

  Future<Either<BaseResponseFailure, ResponseMsg>> verifyRegister(
    String email,
    String code,
  );

  Future<Either<BaseResponseFailure, User>> authLogin(AuthRequestDto request);

  Future<bool?> getIsLogin();

  Future<Either<BaseResponseFailure, ResponseMsg>> authForgotPassword(
    String email,
  );

  Future<Either<BaseResponseFailure, ResponseMsg>> requestOTP(String email);

  Future<Either<BaseResponseFailure, ResponseMsg>> verifyForgotPassword(
    String email,
    String code,
  );

  Future<Either<BaseResponseFailure, ResponseMsg>> ForgotPasswordFormSubmit(
    ForgotPasswordRequestDto request,
  );

  // ####################

  Future<String?> getToken();

  Future<String?> getIdentifier();

  Future<String> getName();

  Future<Either<BaseResponseFailure, void>> authLogout();

  Future<Either<BaseResponseFailure, SignUpModel>> authRegisterUpdate(
    RegisterUpdateDto request,
  );

  Future<Either<BaseResponseFailure, SignUpModel>> createPassword(
    PasswordRequestDto request,
  );

  Future<String?> getLastLogin();

  Future<String?> getRefreshToken();

  Future<Either<BaseResponseFailure, Token>> refreshToken(String refreshToken);

  Future<Either<BaseResponseFailure, Meta>> requestOTPRemoveAccount(
    String email,
  );

  Future<Either<BaseResponseFailure, Meta>> verifyRemoveAccount(
    String email,
    String code,
  );

  Future<Either<BaseResponseFailure, Meta>> requestOTPDeactiveAccount(
    String email,
  );

  Future<Either<BaseResponseFailure, Meta>> verifyDeactiveAccount(
    String email,
    String code,
  );
}
