import 'package:dartz/dartz.dart';

import '/path.dart';

abstract class ProfileRepository {
  Future<Either<BaseResponseFailure, User>> getProfile();
  Future<Either<BaseResponseFailure, User>> updateProfile(
    ChangeProfileRequestDto request,
  );
}
