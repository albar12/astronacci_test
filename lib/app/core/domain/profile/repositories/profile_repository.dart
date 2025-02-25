import 'package:dartz/dartz.dart';

import '/path.dart';

abstract class ProfileRepository {
  Future<Either<BaseResponseFailure, ProfileModel>> getProfile();
  Future<Either<BaseResponseFailure, List<UniversityModel>>> getProgramStudy();
  Future<Either<BaseResponseFailure, ProfileModel>> updateProfile(ChangeProfileRequestDto request);
  Future<Either<BaseResponseFailure, Meta>> changePassword(ChangePasswordRequestDto request);
  Future<Either<BaseResponseFailure, Meta>> removeAccount(RemoveAccountRequestDto request);
  Future<Either<BaseResponseFailure, Meta>> deactiveAccount(RemoveAccountRequestDto request);
}
