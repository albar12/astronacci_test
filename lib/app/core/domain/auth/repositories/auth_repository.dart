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

  Future<Either<BaseResponseFailure, UserWithPage>> getListUsers(
    UsersRequestDto request,
  );

  Future<Either<BaseResponseFailure, void>> authLogout();
}
